class Notification < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_one_attached :photo
  belongs_to :route
  validates :description, presence: true, length: { minimum: 1 }
  validates :notification_start, presence: true
end
