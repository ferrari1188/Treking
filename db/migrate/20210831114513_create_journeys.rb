class CreateJourneys < ActiveRecord::Migration[6.0]
  def change
    create_table :journeys do |t|
      t.references :route, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :journey_start, null: false
      t.datetime :journey_end, null: false
      t.timestamps
    end
  end
end
