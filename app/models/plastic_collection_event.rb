class PlasticCollectionEvent < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  has_event_calendar
  belongs_to :school
  belongs_to :plastic_collection_source
  #validations
  validates :school_id  , :plastic_collection_source_id,:start_at,:end_at,:plastic_weight,:plastic_weight,:volunteers_present,
            :presence => true
  validates :money_given,:plastic_weight,
            :numericality => {:greater_than_or_equal_to => 0}
  
  
  def name
    self.school.name
  end
  
  def color
     'Green'
   end
  
end
