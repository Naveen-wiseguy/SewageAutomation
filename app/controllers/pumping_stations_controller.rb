class PumpingStationsController < ApplicationController
skip_before_action :verify_authenticity_token
 def new
    @treatment_plant=TreatmentPlant.find(params[:treatment_plant_id])
    @pumping_station=@treatment_plant.pumping_stations.build
 end

 def create
    @treatment_plant=TreatmentPlant.find(params[:treatment_plant_id])
    @pumping_station=@treatment_plant.pumping_stations.build(pumping_params)
    if @pumping_station.save then
      flash[:success]="Created the pumping station"
      redirect_to root_path
    else
      flash[:danger]="Unable to create "
      redirect_to root_path
    end
 end

  def update
    if request.put? then
	#inputPath=params[:file].path
	CSV.parse(request.raw_post()) do |row|
	  @pumping_station=PumpingStation.find(row[0].to_i)
	  @pumping_station.update(volume: row[1].to_i)
	  processing
	  render text: "OK\n#{@pumping_station.valve_open}\n#{@pumping_station.second_valve_open}"
	end
    else  render text: "Nothing !#{request.raw_post()}"
    end
  end

 def pumping_params
    params.require(:pumping_station).permit(:volume,:valve_open,:location,:priority,:capacity,:alert,:second_valve_open)
 end

 def processing
   @treatment_plant=TreatmentPlant.find(@pumping_station.treatment_plant_id)
   if @treatment_plant.alert then return end
   else
     percent=((@pumping_station.capacity-@pumping_station.volume)/@pumping_station.capacity).to_f
     percent=percent*100
     if percent>=90
       @pumping_station.update(alert: true)
     else
       @pumping_station.update(alert: false)
       if @pumping_station.second_valve_open
         @pumping_station.update(second_valve_open: true)
     end
     max=0
     max_id=0
     @treatment_plant.pumping_stations.each do |station|
       pri=station.priority*2-(station.capacity-station.volume)
       if pri>max then
        max=pri
        maxid=station.id
       end
     end
     @treatment_plant.pumping_stations.each do |station|
       pri=station.priority*2-(station.capacity-station.volume)
       if station.id==maxid
        station.update(valve_open: true)
       else
        station.valve_open=false
       end
     end
   end
 end
end
