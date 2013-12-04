class Presentation < ActiveRecord::Base
  has_event_calendar
  belongs_to :presentation_type
  belongs_to :school
  
  def name 
     self.school.name
  end
  
  def color
    '#DD8800'
  end
  
  
end
