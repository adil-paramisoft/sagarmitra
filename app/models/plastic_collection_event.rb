class PlasticCollectionEvent < ActiveRecord::Base
  has_event_calendar
  belongs_to :school
  belongs_to :plastic_collection_source
  validates :school_id , :date , :plastic_collection_source_id, :presence => true
  
  def name
    self.school.name
  end
  
  def color
     'Green'
   end
  
end
