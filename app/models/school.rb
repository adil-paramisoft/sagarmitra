class School < ActiveRecord::Base
  has_one :plastic_collection_source
  has_many :presentations
  belongs_to :program_state
  belongs_to :school_type
  belongs_to :school_medium
  
  validates :school_medium_id , :program_state_id , :school_type_id , :total_students , :name , :address , :presence => true
end
