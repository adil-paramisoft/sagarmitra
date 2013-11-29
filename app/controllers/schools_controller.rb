class SchoolsController < ApplicationController
  #before_action :set_school, only: [:show, :edit, :update, :destroy]
  before_action :load_plastic_collection_event, only: :create
  load_and_authorize_resource
  # GET /schools
  # GET /schools.json
  def index
    view_type = ["table", "map"].include?(params[:type]) ? params[:type] : nil
    @view_type =  view_type || "map"
    @schools = School.all
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
    @plastic_collection_events = @school.plastic_collection_events
    @presentation_type = PresentationType .all 
    @presentations = @school.presentations
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: 'School was successfully created.' }
        format.json { render action: 'show', status: :created, location: @school }
      else
        format.html { render action: 'new' }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url }
      format.json { head :no_content }
    end
  end
  
  
  def presentation
    presentation_type_id = params[:presentation_id]
    if presentation_type_id.size > 0 
    @presentations = @school.presentations.where(:presentation_type_id=>presentation_type_id) 
  else
    @presentations = @school.presentations 
  end
     respond_to do |format|
       format.html { render :partial=>'presentations_rows'  }
       format.json { head :no_content }
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end
    
     def load_school_volunteer
        @school = School.new(school_params)
     end



    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name, :address, :school_type_id, :program_state_id, :total_students, :school_medium_id, :number_of_collections)
    end
end
