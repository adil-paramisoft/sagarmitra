class SchoolVolunteer < ActiveRecord::Base

  # Associations
  belongs_to :school

  #validations
  validates :volunteer , :mobile , :name , :email , 
            :presence => true

  # Normalizes the attribute itself before validation
   phony_normalize :mobile, :default_country_code => 'IN'
   
   # Creates method normalized_fax_number that returns the normalized version of fax_number
   #  phony_normalized_method :mobile
  #validates :mobile, format: { with: /\d{10}/, message: "bad format" }
  validates_plausible_phone :mobile, :with => /\d{10}/
  validates :mobile, :phony_plausible => true
  validates_uniqueness_of :email
  # Normalizes the attribute itself before validation
  #phony_normalize :mobile, :default_country_code => 'IN'
  # Creates method normalized_fax_number that returns the normalized version of fax_number
  #phony_normalized_method :mobile

  # Nested attributes
  accepts_nested_attributes_for :school


  def upload_flickr_photos
    self.school.upload_flickr_photo
    self.school.principal_detail.upload_flickr_photo
  end
  
end
