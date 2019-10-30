class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
          # :confirmable, :omniauthable, :trackable,
  include DeviseTokenAuth::Concerns::User

  # Associations
  has_many :powder_rooms, dependent: :destroy
  has_many :likes,        dependent: :destroy
  has_many :reviews,      dependent: :destroy

  # Validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :provider,              presence: true
  validates :uid,                   presence: true
  validates :password,              presence: true, length: { minimum: 6, maximum: 128 }
  validates :password_confirmation, presence: true, length: { minimum: 6, maximum: 128 }
  validates :nickname,              presence: true, length: { maximum: 20 }
  validates :email,                 presence: true, uniqueness: true,
                                    format: { with: VALID_EMAIL_REGEX }
end
