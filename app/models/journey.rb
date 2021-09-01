class Journey < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_many :notifications
  belongs_to :user
  belongs_to :route
  validates :journey_start, presence: true
end
