class PlasticCollectionSource < ActiveRecord::Base
  belongs_to :plastic_collection_event
  #validations
  validates :name , :address , :contact_person, :phone_no_1, 
            :presence => true
  
end
