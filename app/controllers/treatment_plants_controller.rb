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

  def tp_params
    params.require(:treatment_plant).permit(:volume,:capacity,:alert)
  end
end
