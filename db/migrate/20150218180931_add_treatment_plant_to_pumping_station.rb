class AddTreatmentPlantToPumpingStation < ActiveRecord::Migration
  def change
    add_reference :pumping_stations, :treatment_plant, index: true
  end
end
