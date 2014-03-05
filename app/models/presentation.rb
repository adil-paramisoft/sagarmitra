class Presentation < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  has_event_calendar
  belongs_to :presentation_type
  belongs_to :school
 #VALIDATIONS 
  validates :school,:presentation_type,:presented_by,:start_at,:end_at,:authorities_present,:followup_volunteer,:followup_volunteer_mno, 
            :presence => true
  validates :audience_count,
            :numericality => {:greater_than_or_equal_to => 0}  
  validates :followup_volunteer_mno, 
            :format => { with: /\d{10}/}
  
  
  def name 
     self.school.name
  end
  
  def color
    '#DD8800'
  end
  
end
