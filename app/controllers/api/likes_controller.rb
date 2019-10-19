class Api::LikesController < ApplicationController
  before_action :authenticate_api_user!, except: :index

  def create
    like = current_api_user.likes.create!(likes_params)
    render json: like
  end

  def destroy
    like = current_api_user.likes.find(params[:id])
    like.destroy!
    render json: like.as_json(only: :id)
  end

  def favorite_rooms
    user_likes = current_api_user.likes
    render json: user_likes.map(&:powder_room)
  end

  private

    def likes_params
      params.permit(:powder_room_id)
    end
end
