class RemoveColumnsFromRoutes < ActiveRecord::Migration[6.0]
  def change
    remove_column :routes, :latitude_start
    remove_column :routes, :longitude_start
    remove_column :routes, :latitude_end
    remove_column :routes, :longitude_end
  end
end
