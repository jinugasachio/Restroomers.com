class Api::PowderRoomsController < ApplicationController
  def index
    @rooms = PowderRoom.all
    render json: @rooms
  end
end
