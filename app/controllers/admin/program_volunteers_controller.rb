class Admin::ProgramVolunteersController < ApplicationController
  #before_action :set_program_volunteer, only: [:show, :edit, :update, :destroy]
  before_action :load_program_volunteer, only: :create
  load_and_authorize_resource
  # GET /program_volunteers
  # GET /program_volunteers.json
  def index
    @program_volunteers = ProgramVolunteer.all
  end

  # GET /program_volunteers/1
  # GET /program_volunteers/1.json
  def show
  end

  # GET /program_volunteers/new
  def new
    @program_volunteer = ProgramVolunteer.new
  end

  # GET /program_volunteers/1/edit
  def edit
  end

  # POST /program_volunteers
  # POST /program_volunteers.json
  def create
    @program_volunteer = ProgramVolunteer.new(program_volunteer_params)

    respond_to do |format|
      if @program_volunteer.save
        format.html { redirect_to admin_program_volunteer_path(@program_volunteer), notice: 'Program volunteer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @program_volunteer }
      else
        format.html { render action: 'new' }
        format.json { render json: @program_volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /program_volunteers/1
  # PATCH/PUT /program_volunteers/1.json
  def update
    respond_to do |format|
      if @program_volunteer.update(program_volunteer_params)
        format.html { redirect_to admin_program_volunteer_path(@program_volunteer), notice: 'Program volunteer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @program_volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program_volunteers/1
  # DELETE /program_volunteers/1.json
  def destroy
    @program_volunteer.destroy
    respond_to do |format|
      format.html { redirect_to admin_program_volunteers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_volunteer
      @program_volunteer = ProgramVolunteer.find(params[:id])
    end
    
    def load_program_volunteer
         @program_volunteer = ProgramVolunteer.new(program_volunteer_params)
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def program_volunteer_params
      params.require(:program_volunteer).permit(:name, :interest, :responsibility, :email, :mobile)
    end
end
