class MvaayooMessagesController < ApplicationController
  def receive
    mobile=params[:msisdn]
    msg=params[:sms].split("ADSCH ").last.to_s
    msg=msg.split("|")
    msg.each do |value|
      value.capitalize!
    end





    circle=params[:circle]
    operator_name=params[:opnm]
    datetime=params[:datetime]

    logger.info("mvaayoo check----------------")
    logger.info(params.inspect)
    msg.each_with_index do |msg,index|
      logger.info(msg +" ---- #{index}")
    end
    logger.info(SchoolType.find_by_name(msg[3]))
    logger.info(SchoolType.find_by_name(msg[3]).id)
    logger.info(msg[4])

    logger.info("mvaayoo check----------------")




        name=msg[1]
    address=msg[2]
    total_students=msg[3]
    school_type_id=SchoolType.find_by_name(msg[3]).id
    school_medium_id=SchoolMedium.find_by_name(msg[4]).id
    contact_person=msg[5]
    email=msg[6]
    mobile_number=msg[7]

    school = School.new(:program_state_id=>1,:name=> name,:address=>address,:total_students=>total_students,:school_type_id=>school_type_id,:school_medium_id=>school_medium_id)
    school.save

    logger.info(school.id)


    @schoolvolunteer=SchoolVolunteer.create(:volunteer=>true,:name=> contact_person,:email=>email,:mobile=>mobile_number,:school=>school)
    head :ok
  end
  def create

  end



end



