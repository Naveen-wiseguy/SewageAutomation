class RemoveValveOpenFromTreatmentPlant < ActiveRecord::Migration
  def change
    remove_column :treatment_plants, :valve_open, :boolean
  end
end
