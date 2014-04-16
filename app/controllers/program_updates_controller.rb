class ProgramUpdatesController < ApplicationController
  before_action :set_program_update, only: [:show, :edit, :update, :destroy]

  # GET /program_updates
  # GET /program_updates.json
  def index
    @program_updates = ProgramUpdate.all
  end

  # GET /program_updates/1
  # GET /program_updates/1.json
  def show
  end

  # GET /program_updates/new
  def new
    @program_update = ProgramUpdate.new
  end

  # GET /program_updates/1/edit
  def edit
  end

  # POST /program_updates
  # POST /program_updates.json
  def create
    @program_update = ProgramUpdate.new(program_update_params)

    respond_to do |format|
      if @program_update.save
        format.html { redirect_to @program_update, notice: 'Program update was successfully created.' }
        format.json { render action: 'show', status: :created, location: @program_update }
      else
        format.html { render action: 'new' }
        format.json { render json: @program_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /program_updates/1
  # PATCH/PUT /program_updates/1.json
  def update
    respond_to do |format|
      if @program_update.update(program_update_params)
        format.html { redirect_to @program_update, notice: 'Program update was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @program_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program_updates/1
  # DELETE /program_updates/1.json
  def destroy
    @program_update.destroy
    respond_to do |format|
      format.html { redirect_to program_updates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_update
      @program_update = ProgramUpdate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_update_params
      params.require(:program_update).permit(:update_text, :from)
    end
end
