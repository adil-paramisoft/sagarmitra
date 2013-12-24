class Admin::PresentationsController < ApplicationController
  #before_action :set_presentation, only: [:show, :edit, :update, :destroy]
  before_action :load_presentation, only: :create
  load_and_authorize_resource
  before_filter :verify_admin
  # GET /presentations
  # GET /presentations.json
  def index
    @presentations = Presentation.all
  end

  # GET /presentations/1
  # GET /presentations/1.json
  def show
  end

  # GET /presentations/new
  def new
    @presentation = Presentation.new
  end

  # GET /presentations/1/edit
  def edit
  end

  # POST /presentations
  # POST /presentations.json
  def create
    @presentation = Presentation.new(presentation_params)
    respond_to do |format|
      if @presentation.save
        format.html { redirect_to admin_presentation_path(@presentation), notice: 'Presentation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @presentation }
      else
        format.html { render action: 'new' }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presentations/1
  # PATCH/PUT /presentations/1.json
  def update
    respond_to do |format|
      if @presentation.update(presentation_params)
        format.html { redirect_to admin_presentation_path(@presentation), notice: 'Presentation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentations/1
  # DELETE /presentations/1.json
  def destroy
    @presentation.destroy
    respond_to do |format|
      format.html { redirect_to presentations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation
      @presentation = Presentation.find(params[:id])
    end

    def load_presentation
      @presentation = Presentation.new(presentation_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presentation_params
      params.require(:presentation).permit(:presented_by, :date, :audience_count, :summary,:start_at,:end_at, :authorities_present, :presentation_type_id, :school_id, :followup_volunteer, :followup_volunteer_mno)
    end
end
