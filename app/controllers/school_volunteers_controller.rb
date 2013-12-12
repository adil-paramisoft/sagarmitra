class SchoolVolunteersController < ApplicationController
 
  #before_action :set_school_volunteer, only: [:show, :edit, :update, :destroy]
  before_action :load_school_volunteer, only: :create
  load_and_authorize_resource
  # GET /school_volunteers
  # GET /school_volunteers.json
  def index
    @school_volunteers = SchoolVolunteer.all
  end

  # GET /school_volunteers/1
  # GET /school_volunteers/1.json
  def show
  end

  # GET /school_volunteers/new
  def new
    @school_volunteer = SchoolVolunteer.new
    @school_volunteer.build_school
  end

  # GET /school_volunteers/1/edit
  def edit
  end

  # POST /school_volunteers
  # POST /school_volunteers.json
  def create
    @school_volunteer = SchoolVolunteer.new(school_volunteer_params)

    respond_to do |format|
      if @school_volunteer.save
        format.html { redirect_to @school_volunteer, notice: 'School volunteer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @school_volunteer }
      else
        
        format.html { render action: 'new' }
        format.json { render json: @school_volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_volunteers/1
  # PATCH/PUT /school_volunteers/1.json
  def update
    respond_to do |format|
      if @school_volunteer.update(school_volunteer_params)
        format.html { redirect_to @school_volunteer, notice: 'School volunteer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @school_volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_volunteers/1
  # DELETE /school_volunteers/1.json
  def destroy
    @school_volunteer.destroy
    respond_to do |format|
      format.html { redirect_to school_volunteers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_volunteer
      @school_volunteer = SchoolVolunteer.find(params[:id])
    end

    def load_school_volunteer
          @school_volunteer = SchoolVolunteer.new(school_volunteer_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_volunteer_params
      params.require(:school_volunteer).permit(:volunteer, :mobile , :email , :name ,  school_attributes:[:id , :name, :address,  :school_medium_id, :total_students, :school_type_id, :program_state_id])
    end
end
