class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :routes
  has_many :journeys
  has_many :notifications, through: :journeys
  validates :first_name, :last_name, presence: true
  validates :email, :password, presence: true, uniqueness: true
end
