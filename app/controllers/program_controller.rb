class ProgramController < ApplicationController

  def index
        
  end
  
  def calender
    @plastic_collection_events = PlasticCollectionEvent.all
    @date = params[:month] ? Date.strptime(params[:month], "%m-%Y") : Date.today
  end
  
end
