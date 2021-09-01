class Route < ApplicationRecord
  belongs_to :user
  has_many :journeys
  has_many :waypoints
  has_many :notifications, through: :journey
  validates :start_location, :end_location, presence: true
  validates :description, length: { minimum: 2 }
end
