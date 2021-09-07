class ChangeNameColoumnToRoutes < ActiveRecord::Migration[6.0]
  def change
    rename_column :routes, :distance, :length
  end
end
