class Api::PowderRoomsController < ApplicationController
  before_action :authenticate_api_user!, only: :create

  def index
    powder_rooms = PowderRoom.where(ancestry: nil)
    render json: powder_rooms
  end

  def show
    powder_room = PowderRoom.find(params[:id])
    if powder_room.children == []
      images      = powder_room.images
      detail      = powder_room.detail
      facility    = powder_room.facility
      likes       = powder_room.likes
      reviews     = powder_room.reviews

      render json: {
        powder_room: powder_room,
        facility: facility,
        detail: detail,
        images: images,
        likes: likes,
        reviews: reviews.as_json(include: [user: { only: :nickname }])
      }
    else
      children = powder_room.children
      render json: children
    end
  end

  def create
    room = current_api_user.powder_rooms.new(room_params[:room_params])
    room.build_facility(room_params[:facility_params])
    room.build_detail(room_params[:detail_params])

    if room.save
      image_files = []
      images_data = room_params[:images_params][:urls]
      images_data.each do |data|
        binding.pry
        image_files.push(base64_conversion(data))
      end
      room.images.create(urls: image_files)
    end
    render json: room
  end

  private

    def split_base64(uri_str)
      if uri_str.match(/data:(.*?);(.*?),(.*)/)
        uri = {}
        uri[:type]      = Regexp.last_match(1)
        uri[:encoder]   = Regexp.last_match(2)
        uri[:data]      = Regexp.last_match(3)
        uri[:extension] = Regexp.last_match(1).split('/')[1]
        uri
      end
    end

    def base64_conversion(uri_str)
      timestamp         = DateTime.now.strftime('%Q')
      image_data        = split_base64(uri_str)
      image_data_string = image_data[:data]
      image_data_binary = Base64.decode64(image_data_string)
      temp_img_file     = Tempfile.create
      temp_img_file.binmode
      temp_img_file << image_data_binary
      temp_img_file.rewind
      img_params = { filename: "pic_#{timestamp}.#{image_data[:extension]}", type: image_data[:type], tempfile: temp_img_file }
      ActionDispatch::Http::UploadedFile.new(img_params)
    end

    def room_params
      params.require(:room).permit(
        room_params: [
          :name,
          :lat,
          :lng
        ],
        images_params: [urls: []],
        facility_params: [
          :dresser,
          :body_mirror,
          :makeup_mirror,
          :wifi,
          :fitting_booth,
          :washstands,
          :luggage_storage,
          :outlet,
          :dust_box,
          :waiting_space,
          :others,
          :membership,
          :rate_plan
        ],
        detail_params: [
          :open,
          :close,
          :phone_number,
          :address,
          :official_url
        ]
      )
    end
end
