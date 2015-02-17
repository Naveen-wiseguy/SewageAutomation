class RenameHeightToVolume < ActiveRecord::Migration
  def change
    rename_column :pumping_stations, :height, :volume
  end
end
