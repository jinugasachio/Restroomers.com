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
  validates :encrypted_password,    presence: true
  validates :nickname,              presence: true, length: { maximum: 20 }
  validates :email,                 presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
end
