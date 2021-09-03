class AddColumnsToRoutes < ActiveRecord::Migration[6.0]
  def change
    remove_column :routes, :start_location
    remove_column :routes, :end_location
    add_column :routes, :route_image_url, :string
    add_column :routes, :location_category, :string
    add_column :routes, :time, :string
    add_column :routes, :distance, :string
  end
end
