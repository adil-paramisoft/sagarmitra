class PresentationTypesController < ApplicationController
  before_action :set_presentation_type, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /presentation_types
  # GET /presentation_types.json
  def index
    @presentation_types = PresentationType.all
  end

  # GET /presentation_types/1
  # GET /presentation_types/1.json
  def show
  end

  # GET /presentation_types/new
  def new
    @presentation_type = PresentationType.new
  end

  # GET /presentation_types/1/edit
  def edit
  end

  # POST /presentation_types
  # POST /presentation_types.json
  def create
    @presentation_type = PresentationType.new(presentation_type_params)

    respond_to do |format|
      if @presentation_type.save
        format.html { redirect_to @presentation_type, notice: 'Presentation type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @presentation_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @presentation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presentation_types/1
  # PATCH/PUT /presentation_types/1.json
  def update
    respond_to do |format|
      if @presentation_type.update(presentation_type_params)
        format.html { redirect_to @presentation_type, notice: 'Presentation type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @presentation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentation_types/1
  # DELETE /presentation_types/1.json
  def destroy
    @presentation_type.destroy
    respond_to do |format|
      format.html { redirect_to presentation_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation_type
      @presentation_type = PresentationType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presentation_type_params
      params.require(:presentation_type).permit(:name, :description)
    end
end
