class PresentationsController < ApplicationController
  #before_action :set_presentation, only: [:show, :edit, :update, :destroy]
  before_action :load_presentation, only: :create
  load_and_authorize_resource

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation
      @presentation = Presentation.find(params[:id])
    end

    def load_presentation
      @presentation = Presentation.new(presentation_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presentation_params
      params.require(:presentation).permit(:presented_by, :date, :audience_count, :summary,:start_at,:end_at, :authorities_present, :presentation_type_id, :school_id, :followup_volunteer, :followup_volunteer_mno)
    end
end
