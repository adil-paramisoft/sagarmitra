module SchoolsHelper
  
  def month_link(month_date,arrow)
    link_to "?month=#{month_date.month}&year=#{month_date.year}\#tabs-4" do
      if arrow=='pre' then
        "<< "+I18n.localize(month_date, :format => "%B").to_s
      elsif arrow=='post'
        I18n.localize(month_date, :format => "%B").to_s+" >>"
      end
    end
  end
  
  # custom options for this calendar
  def event_calendar_opts
    { 
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => "<h3>"+I18n.localize(@shown_month, :format => "%B %Y")+"</h3>",
      :previous_month_text => "<h4>"+ month_link(@shown_month.prev_month,"pre")+"</h4>",
      :next_month_text => "<h4>"+month_link(@shown_month.next_month,"post")  +"</h4>"    }
      
  end
  
  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event = args[:event]
      %(<a href="/schools/#{event.school.id}" title="#{h(event.name)}">#{h(event.name)}->#{event.class}</a>)
    end
  end
  
  
  
  def settabelstyles state
    case state
    when 1..8,13   
       "info"
    when 9,14    
      "success"
    when 10,11,16
      "error"
    when 12,15,17,18
      "warning"
    else

    end
    
    
   
  end
  
end
