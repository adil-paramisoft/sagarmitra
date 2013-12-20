class PlasticCollectionEventsController < ApplicationController
  
  #before_action :set_plastic_collection_event, only: [:show, :edit, :update, :destroy]
  before_action :load_plastic_collection_event, only: :create
  load_and_authorize_resource
  # GET /plastic_collection_events
  # GET /plastic_collection_events.json
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
      @shown_month = Date.civil(@year, @month)
      @event_strips = PlasticCollectionEvent.event_strips_for_month(@shown_month)
      @event_strips.concat(Presentation.event_strips_for_month(@shown_month))
  end

  # GET /plastic_collection_events/1
  # GET /plastic_collection_events/1.json


  # GET /plastic_collection_events/new
  

  # GET /plastic_collection_events/1/edit


  # POST /plastic_collection_events
  # POST /plastic_collection_events.json
  

  # PATCH/PUT /plastic_collection_events/1
  # PATCH/PUT /plastic_collection_events/1.json
  

  # DELETE /plastic_collection_events/1
  # DELETE /plastic_collection_events/1.json
  def destroy
    @plastic_collection_event.destroy
    respond_to do |format|
      format.html { redirect_to plastic_collection_events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plastic_collection_event
      @plastic_collection_event = PlasticCollectionEvent.find(params[:id])
    end

    def load_plastic_collection_event
         @plastic_collection_event = PlasticCollectionEvent.new(plastic_collection_event_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plastic_collection_event_params
      params.require(:plastic_collection_event).permit(:plastic_weight, :money_given, :volunteers_present, :plastic_collection_source_id, :date,:start_at,:end_at, :quality_remark, :feedback, :school_id)
    end
  
  
end
