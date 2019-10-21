class Api::PowderRoomsController < ApplicationController
  before_action :authenticate_api_user!, only: :create

  def index
    powder_rooms = PowderRoom.where(ancestry: nil) # 親のみを取り出す
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
    # binding.pry
    room = current_api_user.powder_rooms.new(room_params[:room_params])
    room.build_images(params[:images_params])
    room.build_facility(params[:facility_params])
    room = room.build_detail(room_params[:detail_params])
    room.save
    render json: room
  end

  private

    def room_params
      params.require(:room).permit(
        room_params: [
          :name,
          :lat,
          :lng,
        ],
        images_params: [:urls],
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
