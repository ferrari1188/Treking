class RemoveJourneyModelFromNotifications < ActiveRecord::Migration[6.0]
  def change
    remove_reference :notifications, :journey, foreign_key: true
    add_reference :notifications, :route, foreign_key: true
  end
end
