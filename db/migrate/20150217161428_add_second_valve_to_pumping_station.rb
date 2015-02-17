class AddSecondValveToPumpingStation < ActiveRecord::Migration
  def change
    add_column :pumping_stations, :second_valve_open, :boolean
  end
end
