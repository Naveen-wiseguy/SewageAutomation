    require 'csv'
class TreatmentPlantsController < ApplicationController
skip_before_action :verify_authenticity_token
  def new
    if session[:loggedin] == false then redirect_to login_path end
    @treatment_plant=TreatmentPlant.new
  end

  def create
    @treatment_plant=TreatmentPlant.new(tp_params)
    if @treatment_plant.save then
      flash[:success]="Created new treatment plant"
      redirect_to @treatment_plant
    end
  end

  def show
    @treatment_plant=TreatmentPlant.find(params[:id])
  end

  def index
    @treatment_plants=TreatmentPlant.all
    respond_to do |format|
        format.html
        format.js
    end
  end

  def update
    if request.put? then
	#inputPath=params[:file].path
	CSV.parse(request.raw_post()) do |row|
	  @treatment_plant=TreatmentPlant.find(row[0].to_i)
	  @treatment_plant.update(volume: row[1].to_i)
	  processing
	  render text: "OK"
	 end
    else render text: "Nothing !#{request.raw_post()}"
	
    end
  end

  def tp_params
    params.require(:treatment_plant).permit(:volume,:capacity,:alert)
  end

 def processing
  percent=((@treatment_plant.capacity-@treatment_plant.volume)/@treatment_plant.capacity).to_f
  percent=percent*100
  if(percent>=90) then
    @treatment_plant.update(alert: true)
    reservoir()
  end
 end

 def reservoir
   @treatment_plant.pumping_stations.each do |station|
     station.update(valve_open: false)
     station.second_valve_open=true if station.alert
   end
 end
end
