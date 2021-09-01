class Notification < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  belongs_to :journey
  validates :category, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :description, presence: true, length: { minimum: 1 }
  validates :notification_start, presence: true
end
