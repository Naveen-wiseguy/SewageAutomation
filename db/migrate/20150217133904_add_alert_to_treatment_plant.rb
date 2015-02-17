class AddAlertToTreatmentPlant < ActiveRecord::Migration
  def change
    add_column :treatment_plants, :alert, :boolean
  end
end
