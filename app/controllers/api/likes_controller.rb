class Api::LikesController < ApplicationController
  before_action :authenticate_api_user!

  # def index
  #   render json: Like.filter_by_post(params[:post_id]).select(:id, :user_id, :post_id)
  # end

  def create
    current_api_user.likes.create!(likes_params)
    head :created
  end

  def destroy
    current_api_user.likes.find(params[:id]).destroy!
    head :ok
  end

  private

    def likes_params
      params.permit(:powder_room_id)
    end
end
