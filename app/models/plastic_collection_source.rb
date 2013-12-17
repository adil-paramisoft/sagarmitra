class PlasticCollectionSource < ActiveRecord::Base
  belongs_to :plastic_collection_event
  #validations
  validates :name , :address , :contact_person,:phone_no_1, 
            :presence => true
            
  validates :phone_no_1, format: { with: /\d{10}/, message: "bad format" }
  validates :phone_no_2, format: { with: /\d{10}/, message: "bad format" },
            allow_blank: true
  validates :phone_no_1,:phone_no_2,
            :numericality => {:greater_than_or_equal_to => 0},allow_blank: true
end
