class Route < ApplicationRecord
  belongs_to :user
  # has_many :journeys
  validates :start_location, :end_location, presence: true
  validates :description, length: { minimum: 25 }
end
