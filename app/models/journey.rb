class Journey < ApplicationRecord
  has_many :notifications
  belongs_to :user
  belongs_to :route
  validates :journey_start, presence: true
end
