class AddColumnToJourneys < ActiveRecord::Migration[6.0]
  def change
    remove_column :journeys, :journey_end, :datetime
    add_column :journeys, :journey_end, :datetime
  end
end
