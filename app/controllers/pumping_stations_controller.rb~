class PumpingStationsController < ApplicationController

 def new
    @treatment_plant=TreatmentPlant.find(params[:treatment_plant_id])
    @pumping_station=@treatment_plant.pumping_stations.build
 end

 def create
    @treatment_plant=TreatmentPlant.find(params[:treatment_plant_id])
    @pumping_station=@treatment_plant.pumping_stations.build(pumping_params)
    if @pumping_station.save then
      flash[:success]="Created the puping station"
      redirect_to root_path
    else
      flash[:danger]="Unable to create "
      redirect_to root_path
    end
 end

 def pumping_params
    params.require(:pumping_station).permit(:volume,:valve_open,:location,:priority,:capacity,:alert,:second_valve_open)
 end
end
