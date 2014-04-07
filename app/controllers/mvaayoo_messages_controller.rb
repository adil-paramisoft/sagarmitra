class MvaayooMessagesController < ApplicationController
  def receive
    @mobile_number=params[:msisdn]
    @msg=params[:sms]
    @circle=params[:circle]
    @operator_name=params[:opnm]
    @datetime=params[:datetime]


    params.each do |param|
      logger.debug "#{param}"
    end


  end
end
