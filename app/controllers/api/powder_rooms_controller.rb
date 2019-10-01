class Api::PowderRoomsController < ApplicationController
  def index
    powder_rooms = PowderRoom.where(ancestry: nil) # 親のみを取り出す
    render json: powder_rooms
    # 上記のように書くことでjbuilderは必要ない。
    # ただ条件によってhtmlを使いたい場合もあると思うので、
    # その場合はchat_spaceの時みたいに分岐させた上で、
    # jbuilderが必要になる。
  end

  # リレーションしてるモデル情報も一緒に返す。
  def show
    powder_room = PowderRoom.find(params[:id])
    if powder_room.children == []
      # i binding.pry
      images      = powder_room.images
      # detail      = powder_room.detail
      # facility    = powder_room.facility
      # powder_room = powder_room.attributes.merge(detail.attributes).merge(facility.attributes)#.merge(images[0].attributes)
      # render json: powder_room
      detail      = powder_room.detail
      facility    = powder_room.facility
      # powder_room = powder_room.attributes.merge(detail.attributes).merge(facility.attributes)#.merge(images[0].attributes)
      render json: {
        powder_room: powder_room,
        facility: facility,
        detail: detail,
        images: images,
      }
      # render json: images
    else
      children = powder_room.children
      render json: children
    end
  end
end
