class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
          # :confirmable, :omniauthable, :trackable,
  include DeviseTokenAuth::Concerns::User

  # Associations
  has_many :powder_rooms, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
