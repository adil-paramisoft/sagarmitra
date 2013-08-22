class PlasticCollectionEvent < ActiveRecord::Base
  belongs_to :school
  belongs_to :plastic_collection_source
  
  validates :school_id , :date , :plastic_collection_source_id, :presence => true
  
end
