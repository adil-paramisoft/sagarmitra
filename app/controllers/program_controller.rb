class ProgramController < ApplicationController

  def index
    @total_student_count = School.sum(:total_students)
    @total_school_count = School.all.size
    @plastic_collected_count = PlasticCollectionEvent.sum(:plastic_weight)
    @green_fund_count = PlasticCollectionEvent.sum(:money_given)

    @total_teachers_involved_count = Presentation.where("presentation_types.name = ?", "Teachers").includes(:presentation_type).sum(:audience_count)
    @activities = PublicActivity::Activity.order("created_at desc").all

    @schools = School.top_five_collections
    logger.info "-------------------------------------------"
    @schools.each { |school| logger.info "#{school.name} - Weight: #{school.plastic_weight} #{school.money_given}" }
    logger.info "-------------------------------------------"
  end

  def calender
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @shown_month = Date.civil(@year, @month)
    @event_strips = PlasticCollectionEvent.event_strips_for_month(@shown_month)
    @event_strips.concat(Presentation.event_strips_for_month(@shown_month))
    @event_strips.concat(OfflineEvent.event_strips_for_month(@shown_month))
  end

end
