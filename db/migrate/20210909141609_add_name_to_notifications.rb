class AddNameToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :name, :string
  end
end
