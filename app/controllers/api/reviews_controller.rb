class Api::ReviewsController < ApplicationController
  before_action :authenticate_api_user!, except: :index

  def index
    render json: Review.where(powder_room_id: params[:id])
  end

  def create
    review = current_api_user.reviews.create(reviews_params)
    render json: review.as_json(include: [user: { only: :nickname }])

    unless images_params[:urls].empty?
      room = PowderRoom.find(reviews_params[:powder_room_id])
      image_files = []
      images_data = images_params[:urls]
      images_data.each do |data|
        image_files.push(decode_base64(data, room))
      end
      room.images.create(urls: image_files)
    end
  end

  # def destroy
  #   review = current_api_user.reviews.find(params[:id])
  #   review.destroy!
  #   render json: review
  # end

  private

    def reviews_params
      params.permit(:rate, :review, :powder_room_id)
    end

    def images_params
      params.permit(urls: [])
    end
end
