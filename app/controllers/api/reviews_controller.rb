class Api::ReviewsController < ApplicationController
  before_action :authenticate_api_user!, except: :index

  def index
    render json: Review.where(powder_room_id: params[:id])
  end

  def create
    review = current_api_user.reviews.create!(reviews_params)
    render json: review.as_json(include: [user: { only: :nickname }])
  end

  def destroy
    review = current_api_user.reviews.find(params[:id])
    review.destroy!
    render json: review
  end

  private

    def reviews_params
      params.permit(:rate, :review, :powder_room_id, images_params: [urls: []])
    end
end
