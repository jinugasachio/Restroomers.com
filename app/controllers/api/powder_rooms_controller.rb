class Api::PowderRoomsController < ApplicationController
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
end
