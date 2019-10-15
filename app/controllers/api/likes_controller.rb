class Api::LikesController < ApplicationController
  before_action :authenticate_api_user!, except: :index

  def index
    render json: Like.where(powder_room_id: params[:id])
  end

  def create
    like = current_api_user.likes.create!(likes_params)
    render json: like
  end

  def destroy
    like = current_api_user.likes.find(params[:id])
    like.destroy!
    render json: like
  end

  def favorite_rooms
    favorite_rooms = []
    user_likes = current_api_user.likes

    user_likes.each do |like|
      id = like.powder_room.id
      room = PowderRoom.find(id)
      favorite_rooms.push(room)
    end
    render json: favorite_rooms
  end

  private

    def likes_params
      params.permit(:powder_room_id)
    end
end
