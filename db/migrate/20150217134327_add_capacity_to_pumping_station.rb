class AddCapacityToPumpingStation < ActiveRecord::Migration
  def change
    add_column :pumping_stations, :capacity, :integer
    add_column :pumping_stations, :alert, :boolean
    rename_column :pumping_stations, :valve, :valve_open
  end
end
