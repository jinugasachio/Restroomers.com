class Api::PowderRoomsController < ApplicationController
  before_action :authenticate_api_user!, only: :create

  def index
    rooms = PowderRoom.where(ancestry: nil)
    render json: rooms
  end

  def show
    room = PowderRoom.find(params[:id])
    if room.children == []
      render json: convert_to_json(room)
    else
      children = room.children
      render json: children
    end
  end

  def create
    room = current_api_user.powder_rooms.new(room_params[:room_params])
    room.build_facility(room_params[:facility_params])
    room.build_detail(room_params[:detail_params])

    if room_params[:images_params][:urls].length.positive?
      binding.pry
      image_files = []
      images_data = room_params[:images_params][:urls]
      images_data.each do |data|
        image_files.push(decode_base64(data, room))
      end
      room.images.create(urls: image_files)
    end
    room.save
    render json: room
  end

  private

    def convert_to_json(room)
      images      = room.images
      detail      = room.detail
      facility    = room.facility
      likes       = room.likes
      reviews     = room.reviews

      {
        powder_room: room,
        facility:    facility,
        detail:      detail,
        images:      images,
        likes:       likes,
        reviews:     reviews.as_json(include: [user: { only: :nickname }])
      }
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
