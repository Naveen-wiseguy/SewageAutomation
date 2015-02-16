class PumpingStation < ActiveRecord::Base
  belongs_to :treatment_plant, dependent: :destroy
end
