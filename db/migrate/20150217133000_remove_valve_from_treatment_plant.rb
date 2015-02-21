class RemoveValveFromTreatmentPlant < ActiveRecord::Migration
  def change
    #remove_column :treatment_plants, :valve, :boolean
    rename_column :treatment_plants, :height, :volume
    add_column :treatment_plants, :capacity, :integer
  end
end
