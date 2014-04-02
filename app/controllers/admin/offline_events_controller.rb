class Admin::OfflineEventsController < ApplicationController

  before_action :load_offline_event, only: :create
  load_and_authorize_resource
  before_filter :verify_admin

  def index
    @offline_events= OfflineEvent.all
  end

  
  def show
    @offline_event = OfflineEvent.find(params[:id])
  end

  # GET /offline_events/new
  def new
    @offline_event = OfflineEvent.new
  end

  # GET /offline_events/1/edit
  def edit
  end

  # POST /offline_events
  # POST /offline_events.json
  def create
    @offline_event = OfflineEvent.new(offline_event_params)

    respond_to do |format|
      if @offline_event.save

        format.html { redirect_to admin_offline_event_path(@offline_event) , notice: 'Offline event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @offline_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @offline_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offline_events/1
  # PATCH/PUT /offline_events/1.json
  def update
    respond_to do |format|
      if @offline_event.update(offline_event_params)

        format.html { redirect_to admin_offline_event_path(@offline_event), notice: 'Offline event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @offline_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offline_events/1
  # DELETE /offline_events/1.json
  def destroy
    @offline_event.destroy
    respond_to do |format|
      format.html { redirect_to admin_offline_events_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_offline_event
    @offline_event = OfflineEvent.find(params[:id])
  end

  def load_offline_event
    @offline_event = OfflineEvent.new(offline_event_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def offline_event_params
    params.require(:offline_event).permit(:school_name, :school_address, :event_name, :event_description, :start_at, :end_at, :volunteers_present)
  end


end