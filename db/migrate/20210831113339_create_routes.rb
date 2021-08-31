class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.string :name
      t.float :longitude_start
      t.float :latitude_start
      t.string :start_location
      t.string :end_location
      t.float :latitude_end
      t.float :longitude_end

      t.timestamps
    end
  end
end
