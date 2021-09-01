class CreateWaypoints < ActiveRecord::Migration[6.0]
  def change
    create_table :waypoints do |t|
      t.float :longitude
      t.float :latitude
      t.references :route, foreign_key: true
      t.string :position
      t.timestamps
    end
  end
end
