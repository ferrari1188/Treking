class AddColumnToNotifications < ActiveRecord::Migration[6.0]
  def change
    remove_column :notifications, :notification_end, :datetime
    add_column :notifications, :notification_end, :datetime
  end
end
