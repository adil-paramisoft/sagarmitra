class SchoolVolunteer < ActiveRecord::Base
  belongs_to :school
  #validations
  validates :volunteer , :mobile , :name , :email , 
            :presence => true

  # Normalizes the attribute itself before validation
   phony_normalize :mobile, :default_country_code => 'IN'
   
   # Creates method normalized_fax_number that returns the normalized version of fax_number
     phony_normalized_method :mobile
  validates :mobile, format: { with: /\d{10}/, message: "bad format" }   
  validates :mobile, :phony_plausible => true
  validates_uniqueness_of :email
 # validates :email, :email => {:strict_mode => true}  
   accepts_nested_attributes_for :school 
  
end
