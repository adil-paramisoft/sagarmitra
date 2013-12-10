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
  
validates :school,:presentation_type,:presented_by,:start_at,:end_at,:authorities_present,:followup_volunteer,:followup_volunteer_mno, :presence => true
validates :audience_count,:numericality => {:greater_than_or_equal_to => 0}  
 validates :followup_volunteer_mno, format: { with: /\d{10}/, message: "bad format" }   
end
