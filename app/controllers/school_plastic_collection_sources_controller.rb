class SchoolPlasticCollectionSourcesController < ApplicationController
  #before_action :set_school_plastic_collection_source, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_action :load_school_plastic_collection_source, only: :create
  load_and_authorize_resource
  # GET /school_plastic_collection_sources
  # GET /school_plastic_collection_sources.json
  def index
    @school_plastic_collection_sources = SchoolPlasticCollectionSource.all
  end

  # GET /school_plastic_collection_sources/1
  # GET /school_plastic_collection_sources/1.json
  def show
  end

  # GET /school_plastic_collection_sources/new
  def new
    @school_plastic_collection_source = SchoolPlasticCollectionSource.new
  end

  # GET /school_plastic_collection_sources/1/edit
  def edit
  end

  # POST /school_plastic_collection_sources
  # POST /school_plastic_collection_sources.json
  def create
    @school_plastic_collection_source = SchoolPlasticCollectionSource.new(school_plastic_collection_source_params)

    respond_to do |format|
      if @school_plastic_collection_source.save
        format.html { redirect_to @school_plastic_collection_source, notice: 'School plastic collection source was successfully created.' }
        format.json { render action: 'show', status: :created, location: @school_plastic_collection_source }
      else
        format.html { render action: 'new' }
        format.json { render json: @school_plastic_collection_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_plastic_collection_sources/1
  # PATCH/PUT /school_plastic_collection_sources/1.json
  def update
    respond_to do |format|
      if @school_plastic_collection_source.update(school_plastic_collection_source_params)
        format.html { redirect_to @school_plastic_collection_source, notice: 'School plastic collection source was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @school_plastic_collection_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_plastic_collection_sources/1
  # DELETE /school_plastic_collection_sources/1.json
  def destroy
    @school_plastic_collection_source.destroy
    respond_to do |format|
      format.html { redirect_to school_plastic_collection_sources_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_plastic_collection_source
      @school_plastic_collection_source = SchoolPlasticCollectionSource.find(params[:id])
    end

    def load_school_plastic_collection_source
         @school_plastic_collection_source = SchoolPlasticCollectionSource.new(school_plastic_collection_source_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_plastic_collection_source_params
      params.require(:school_plastic_collection_source).permit(:schoold_id, :plastic_collection_source)
    end
end
