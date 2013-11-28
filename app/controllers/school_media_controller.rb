class SchoolMediaController < ApplicationController
  #before_action :set_school_medium, only: [:show, :edit, :update, :destroy]
  before_action :load_school_medium, only: :create
  load_and_authorize_resource
  # GET /school_media
  # GET /school_media.json
  def index
    @school_media = SchoolMedium.all
  end

  # GET /school_media/1
  # GET /school_media/1.json
  def show
  end

  # GET /school_media/new
  def new
    @school_medium = SchoolMedium.new
  end

  # GET /school_media/1/edit
  def edit
  end

  # POST /school_media
  # POST /school_media.json
  def create
    @school_medium = SchoolMedium.new(school_medium_params)

    respond_to do |format|
      if @school_medium.save
        format.html { redirect_to @school_medium, notice: 'School medium was successfully created.' }
        format.json { render action: 'show', status: :created, location: @school_medium }
      else
        format.html { render action: 'new' }
        format.json { render json: @school_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_media/1
  # PATCH/PUT /school_media/1.json
  def update
    respond_to do |format|
      if @school_medium.update(school_medium_params)
        format.html { redirect_to @school_medium, notice: 'School medium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @school_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_media/1
  # DELETE /school_media/1.json
  def destroy
    @school_medium.destroy
    respond_to do |format|
      format.html { redirect_to school_media_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_medium
      @school_medium = SchoolMedium.find(params[:id])
    end
    
    
    def load_school_medium
         @school_medium = SchoolMedium.new(school_medium_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_medium_params
      params.require(:school_medium).permit(:name, :description)
    end
end
