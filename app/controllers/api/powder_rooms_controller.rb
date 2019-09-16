class Api::PowderRoomsController < ApplicationController
  def index
    powder_rooms = PowderRoom.all
    render json: powder_rooms
    # 上記のように書くことでjbuilderは必要ない。
    # ただ条件によってhtmlを使いたい場合もあると思うので、
    # その場合はchat_spaceの時みたいに分岐させた上で、
    # jbuilderが必要になる。
  end
end
