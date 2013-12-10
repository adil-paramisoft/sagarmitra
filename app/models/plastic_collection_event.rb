class PlasticCollectionEvent < ActiveRecord::Base
  has_event_calendar
  belongs_to :school
  belongs_to :plastic_collection_source
  validates :school_id  , :plastic_collection_source_id,:start_at,:end_at,:plastic_weight,:money_given,:plastic_weight,:volunteers_present,
   :presence => true
   
   validate :plastic_weight,:money_given,numericality: true
  
  def name
    self.school.name
  end
  
  def color
     'Green'
   end
  
end
