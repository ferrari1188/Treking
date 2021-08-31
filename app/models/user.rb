class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :routes
  # has_many :journeys
  validates :first_name, :last_name, presence: true
  validates :email, :password, presence: true, uniqueness: true
end
