class Route < ApplicationRecord
  belongs_to :user
  has_many :journeys
  has_many :waypoints
  has_many :notifications, through: :journey
  validates :description, length: { minimum: 2 }

  geocoded_by :start_location
  after_validation :geocode, if: :will_save_change_to_start_location?
end
