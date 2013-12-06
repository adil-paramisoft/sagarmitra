module SchoolsHelper
  
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), "?month=#{month_date.month}&year=#{month_date.year}\#tabs-4")
  end
  
  # custom options for this calendar
  def event_calendar_opts
    { 
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => "<h3>"+I18n.localize(@shown_month, :format => "%B %Y")+"</h3>",
      :previous_month_text => "<h4>"+"<< " + month_link(@shown_month.prev_month)+"</h4>",
      :next_month_text => "<h4>"+month_link(@shown_month.next_month) + " >>"+"</h4>"    }
      
  end
  
  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event = args[:event]
      %(<a href="/schools/#{event.school.id}" title="#{h(event.name)}">#{h(event.name)}->#{event.class}</a>)
    end
  end
  
  
  
end
