class Notification < ApplicationRecord
  belongs_to :journeys
  belongs_to :route, through: :journeys
  belongs_to :user, through: :journeys
  validates :category, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :notification_start, presence: true
end
