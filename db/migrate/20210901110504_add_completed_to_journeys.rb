class AddCompletedToJourneys < ActiveRecord::Migration[6.0]
  def change
    add_column :journeys, :completed, :boolean, default: false
  end
end
