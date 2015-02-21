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
  end

  def update
    if request.put? then
	#inputPath=params[:file].path
	CSV.parse(request.raw_post()) do |row|
	  @treatment_plant=TreatmentPlant.find(row[0].to_i)
	  @treatment_plant.update(volume: row[1].to_i)
	  render text: "OK"
	 end
    else render text: "Nothing !#{request.raw_post()}"
	
    end
  end

  def tp_params
    params.require(:treatment_plant).permit(:volume,:capacity,:alert)
  end
end
