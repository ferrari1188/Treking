class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :category
      t.float :latitude
      t.float :longitude
      t.datetime :notification_start_date, null: false
      t.datetime :notification_stop_date, null: false
      t.references :journey, foreign_key: true
      t.text :description
      t.string :image
      t.timestamps
    end
  end
end
