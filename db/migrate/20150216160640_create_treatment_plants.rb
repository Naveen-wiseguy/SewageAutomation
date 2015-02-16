class CreateTreatmentPlants < ActiveRecord::Migration
  def change
    create_table :treatment_plants do |t|
      t.integer :height
      t.boolean :valve_open

      t.timestamps
    end
  end
end
