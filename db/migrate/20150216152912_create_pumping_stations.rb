class CreatePumpingStations < ActiveRecord::Migration
  def change
    create_table :pumping_stations do |t|
      t.integer :height
      t.boolean :valve
      t.string :location
      t.integer :priority

      t.timestamps
    end
  end
end
