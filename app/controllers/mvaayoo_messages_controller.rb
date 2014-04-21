#The Mvaayoo services calls the following  URL "url/mvaayoomessages/receive?msisdn=!MOBILENO!&sms=!MSG!&circle=!CIRCLE!&opnm=!OPNM!&datetime=!TIMESTAMP!"
class MvaayooMessagesController < ApplicationController
  def receive
    mobile=params[:msisdn] # "params [msisdn] gets the mobile number from which the message was sent"

    if(params[:sms].include?("ADSCH"))

    msg = params[:sms].split("ADSCH ").last.to_s
    msg = msg.split("|")
    msg.each(&:strip!)
    circle = params[:circle]
    operator_name = params[:opnm]
    datetime = params[:datetime]
    school_name = msg[0]
    address = msg[1]
    total_students = msg[2]
    school_type_id = SchoolType.find_by_name(msg[3].capitalize).id
    school_medium_id = SchoolMedium.find_by_name(msg[4].capitalize).id
    contact_person = msg[5]
    email=msg[6]
    mobile_number = msg[7]
    logger.info("-------mvaayoo check----------------")
    logger.info(params.inspect)
    msg.each_with_index do |msg,index|
      logger.info(msg +" ---- #{index}")
    end
    logger.info(SchoolType.find_by_name(msg[3]))
    logger.info(SchoolType.find_by_name(msg[3]).id)
    logger.info(msg[4])
    logger.info("Name="+school_name)
    logger.info("total_students="+total_students)
    logger.info("school_type_id="+school_type_id.to_s)
    logger.info("school_medium_id="+school_medium_id.to_s)
    logger.info("contact_person="+email)
    logger.info("mobile_number="+mobile_number)

    logger.info("--------mvaayoo check----------------")


    school = School.create(:address=>address,:school_type_id=>school_type_id,:program_state_id=>1,:total_students=>total_students,:school_medium_id=>school_medium_id,:name=> school_name)


    logger.info(school.id)


    @school_volunteer = SchoolVolunteer.create(:volunteer=>true,:name=> contact_person,:email=>email,:mobile=>mobile_number,:school=>school)
    head :ok
    end


    if (params[:sms].include?("UPDATE"))
      from = params[:msidn]
      update_text = params[:sms].split("UPDATE ").last.to_s
      @program_update=ProgramUpdate.create(:from => from,:update_text => update_text)
      head :ok
    end

  end

  def create

  end



end



