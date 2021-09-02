class RemoveColumnsFromWaypoints < ActiveRecord::Migration[6.0]
  def change
    remove_column :waypoints, :position
    add_column :waypoints, :sequence, :integer
  end
end
