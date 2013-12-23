class Admin::PlasticCollectionSourcesController < ApplicationController
  #before_action :set_plastic_collection_source, only: [:show, :edit, :update, :destroy]
  before_action :load_plastic_collection_source, only: :create
   load_and_authorize_resource
  # GET /plastic_collection_sources
  # GET /plastic_collection_sources.json
  def index
    @plastic_collection_sources = PlasticCollectionSource.all
  end

  # GET /plastic_collection_sources/1
  # GET /plastic_collection_sources/1.json
  def show
  end

  # GET /plastic_collection_sources/new
  def new
    @plastic_collection_source = PlasticCollectionSource.new
  end

  # GET /plastic_collection_sources/1/edit
  def edit
  end

  # POST /plastic_collection_sources
  # POST /plastic_collection_sources.json
  def create
    @plastic_collection_source = PlasticCollectionSource.new(plastic_collection_source_params)

    respond_to do |format|
      if @plastic_collection_source.save
        format.html { redirect_to @plastic_collection_source, notice: 'Plastic collection source was successfully created.' }
        format.json { render action: 'show', status: :created, location: @plastic_collection_source }
      else
        format.html { render action: 'new' }
        format.json { render json: @plastic_collection_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plastic_collection_sources/1
  # PATCH/PUT /plastic_collection_sources/1.json
  def update
    respond_to do |format|
      if @plastic_collection_source.update(plastic_collection_source_params)
        format.html { redirect_to @plastic_collection_source, notice: 'Plastic collection source was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @plastic_collection_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plastic_collection_sources/1
  # DELETE /plastic_collection_sources/1.json
  def destroy
    @plastic_collection_source.destroy
    respond_to do |format|
      format.html { redirect_to plastic_collection_sources_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plastic_collection_source
      @plastic_collection_source = PlasticCollectionSource.find(params[:id])
    end

    def load_plastic_collection_source
           @plastic_collection_source = PlasticCollectionSource.new(plastic_collection_source_params)
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def plastic_collection_source_params
      params.require(:plastic_collection_source).permit(:name, :address, :contact_person, :phone_no_1, :phone_no_2, :website, :email)
    end
end
