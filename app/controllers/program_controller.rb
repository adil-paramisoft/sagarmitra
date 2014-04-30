class ProgramController < ApplicationController

  def index
    @total_student_count = School.sum(:total_students)
    @total_school_count = School.all.size
    @plastic_collected_count = PlasticCollectionEvent.sum(:plastic_weight)
    @green_fund_count = PlasticCollectionEvent.sum(:money_given)

    @activities = PublicActivity::Activity.order("created_at desc").all
    @top_three_schools_with_photos = School.top_three_collections
  end

  def calender
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @shown_month = Date.civil(@year, @month)
    @event_strips = PlasticCollectionEvent.event_strips_for_month(@shown_month)
    @event_strips.concat(Presentation.event_strips_for_month(@shown_month))

  end

end
