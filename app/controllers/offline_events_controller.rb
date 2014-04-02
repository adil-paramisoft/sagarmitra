class OfflineEventsController < ApplicationController


  def show
    @offline_event = OfflineEvent.find(params[:id])
  end

end