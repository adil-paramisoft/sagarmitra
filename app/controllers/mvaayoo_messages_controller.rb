class MvaayooMessagesController < ApplicationController
  def receive
    @mobile_number=params[:msisdn]
    @msg=params[:sms]
    @circle=params[:circle]
    @operator_name=params[:opnm]
    @datetime=params[:datetime]

    logger.info("mvaayoo check----------------")
    logger.info(params.inspect)
    logger.info("mvaayoo check----------------")


  end
end
