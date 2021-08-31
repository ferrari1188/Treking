class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :category
      t.float :latitude
      t.float :longitude
      t.datetime :created_at, null: false
      t.datetime :stopped_at, null: false
      t.references :journey, foreign_key: true
      t.text :description
      t.string :image
      t.timestamps
    end
  end
end
