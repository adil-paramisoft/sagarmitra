class MvaayooMessagesController < ApplicationController
  def receive
    @mobile_number=params[:msisdn]
    @msg=params[:sms].split(/;/)
    @circle=params[:circle]
    @operator_name=params[:opnm]
    @datetime=params[:datetime]

    logger.info("mvaayoo check----------------")
    logger.info(params.inspect)
    logger.info(@msg)
    logger.info(@msg.each)
    logger.info("mvaayoo check----------------")

    params[:name]=@msg[0]
    params[:address]=@msg[1]
    params[:total_students]=@msg[2]
    params[:school_type_id]=SchoolType.find(:first, :conditions => ["name=#{@msg[2]}"],:select =>id)
    params[:school_medium_id]=SchoolMedium.find(:first,:conditions =>["name=#{@msg[3]}"],:select =>id)
    params[:contact_person]=@msg[4]
    params[:email]=@msg[5]
    params[:mobile]=@mobile_number
    School.create(params)
    redirect_to :controller => 'schools', :action => 'create',:format =>'mvaayoo_response',:params =>params

  end
end
