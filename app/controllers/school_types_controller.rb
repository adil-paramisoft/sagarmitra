class SchoolTypesController < ApplicationController
  before_action :set_school_type, only: [:show, :edit, :update, :destroy]

  # GET /school_types
  # GET /school_types.json
  def index
    @school_types = SchoolType.all
  end

  # GET /school_types/1
  # GET /school_types/1.json
  def show
  end

  # GET /school_types/new
  def new
    @school_type = SchoolType.new
  end

  # GET /school_types/1/edit
  def edit
  end

  # POST /school_types
  # POST /school_types.json
  def create
    @school_type = SchoolType.new(school_type_params)

    respond_to do |format|
      if @school_type.save
        format.html { redirect_to @school_type, notice: 'School type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @school_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @school_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_types/1
  # PATCH/PUT /school_types/1.json
  def update
    respond_to do |format|
      if @school_type.update(school_type_params)
        format.html { redirect_to @school_type, notice: 'School type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @school_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_types/1
  # DELETE /school_types/1.json
  def destroy
    @school_type.destroy
    respond_to do |format|
      format.html { redirect_to school_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_type
      @school_type = SchoolType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_type_params
      params.require(:school_type).permit(:name, :description)
    end
end
