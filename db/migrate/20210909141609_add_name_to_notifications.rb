class AddNameToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :name, :string
    add_column :notifications, :added_by, :string
  end
end
