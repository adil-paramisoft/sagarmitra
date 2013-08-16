class PlasticCollectionEventsController < ApplicationController
  before_action :set_plastic_collection_event, only: [:show, :edit, :update, :destroy]

  # GET /plastic_collection_events
  # GET /plastic_collection_events.json
  def index
    @plastic_collection_events = PlasticCollectionEvent.all
  end

  # GET /plastic_collection_events/1
  # GET /plastic_collection_events/1.json
  def show
  end

  # GET /plastic_collection_events/new
  def new
    @plastic_collection_event = PlasticCollectionEvent.new
  end

  # GET /plastic_collection_events/1/edit
  def edit
  end

  # POST /plastic_collection_events
  # POST /plastic_collection_events.json
  def create
    @plastic_collection_event = PlasticCollectionEvent.new(plastic_collection_event_params)

    respond_to do |format|
      if @plastic_collection_event.save
        format.html { redirect_to @plastic_collection_event, notice: 'Plastic collection event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @plastic_collection_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @plastic_collection_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plastic_collection_events/1
  # PATCH/PUT /plastic_collection_events/1.json
  def update
    respond_to do |format|
      if @plastic_collection_event.update(plastic_collection_event_params)
        format.html { redirect_to @plastic_collection_event, notice: 'Plastic collection event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @plastic_collection_event.errors, status: :unprocessable_entity }
      end
    end
  end

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

    # Never trust parameters from the scary internet, only allow the white list through.
    def plastic_collection_event_params
      params.require(:plastic_collection_event).permit(:plastic_weight, :money_given, :volunteers_present, :plastic_collection_agency_id, :date, :quality_remark, :feedback, :school_id)
    end
end
