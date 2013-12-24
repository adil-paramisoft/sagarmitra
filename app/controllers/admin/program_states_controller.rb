class Admin::ProgramStatesController < ApplicationController
  #before_action :set_program_state, only: [:show, :edit, :update, :destroy]
  before_action :load_program_state, only: :create
  load_and_authorize_resource
  before_filter :verify_admin
  # GET /program_states
  # GET /program_states.json
  def index
    @program_states = ProgramState.all
  end

  # GET /program_states/1
  # GET /program_states/1.json
  def show
  end

  # GET /program_states/new
  def new
    @program_state = ProgramState.new
  end

  # GET /program_states/1/edit
  def edit
  end

  # POST /program_states
  # POST /program_states.json
  def create
    @program_state = ProgramState.new(program_state_params)

    respond_to do |format|
      if @program_state.save
        format.html { redirect_to admin_program_state_path(@program_state), notice: 'Program state was successfully created.' }
        format.json { render action: 'show', status: :created, location: @program_state }
      else
        format.html { render action: 'new' }
        format.json { render json: @program_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /program_states/1
  # PATCH/PUT /program_states/1.json
  def update
    respond_to do |format|
      if @program_state.update(program_state_params)
        format.html { redirect_to admin_program_state_path( @program_state), notice: 'Program state was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @program_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program_states/1
  # DELETE /program_states/1.json
  def destroy
    @program_state.destroy
    respond_to do |format|
      format.html { redirect_to admin_program_states_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_state
      @program_state = ProgramState.find(params[:id])
    end
    
    def load_program_state
         @program_state = ProgramState.new(program_state_params)
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def program_state_params
      params.require(:program_state).permit(:name, :description)
    end
end
