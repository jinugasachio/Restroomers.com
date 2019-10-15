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

  private

    def likes_params
      params.permit(:powder_room_id)
    end
end
