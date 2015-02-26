class CreateManholeSensors < ActiveRecord::Migration
  def change
    create_table :manhole_sensors do |t|
      t.string :location
      t.integer :limit
      t.boolean :alert

      t.timestamps
    end
  end
end
