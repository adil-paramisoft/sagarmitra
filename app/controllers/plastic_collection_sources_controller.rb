class PlasticCollectionSourcesController < ApplicationController
  #before_action :set_plastic_collection_source, only: [:show, :edit, :update, :destroy]
  before_action :load_plastic_collection_source, only: :create
   load_and_authorize_resource
  # GET /plastic_collection_sources
  # GET /plastic_collection_sources.json
  def index
    @plastic_collection_sources = PlasticCollectionSource.all
  end


  def show
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
