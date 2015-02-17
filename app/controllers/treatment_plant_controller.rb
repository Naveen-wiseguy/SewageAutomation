class TreatmentPlantController < ApplicationController
skip_before_action :verify_authenticity_token
  def new
    if session[:loggedin] == false then redirect_to login_path
    @tp=TreatmentPlant.new
  end

  def create
    @tp=TreatmentPlant.new(tp_params)
    if @tp.save then
      flash[:success]="Created new treatment plant"
      redirect_to @tp
  end

  def show
    @tp=TreatmentPlant.find(params[:id])
  end

  def index
    @tps=TreatmentPlant.all
  end

  def tp_params
    params.require(:treatment_plant).permit(:volume,:capacity,:alert)
  end
end
