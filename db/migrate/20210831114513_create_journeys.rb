class CreateJourneys < ActiveRecord::Migration[6.0]
  def change
    create_table :journeys do |t|
      t.references :route, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :created_at, null: false
      t.datetime :stopped_at, null: false
      t.timestamps
    end
  end
end
