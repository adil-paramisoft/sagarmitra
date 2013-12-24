class Admin::ProgramController < ApplicationController
  before_filter :verify_admin
  def index
        
  end
  
  def calender
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @shown_month = Date.civil(@year, @month)
    @event_strips = PlasticCollectionEvent.event_strips_for_month(@shown_month)
    @event_strips.concat(Presentation.event_strips_for_month(@shown_month))
  end
  
end
