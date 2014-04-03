class SchoolVolunteer < ActiveRecord::Base

  # Associations
  belongs_to :school

  #validations
  validates :volunteer , :mobile , :name , :email ,
            :presence => true

  validates :volunteer , :mobile , :name , :email ,
            :presence => true


  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/,
                              message: "only allows letters" }

  validates :mobile, format: { with:/^9\d{9}$/ }

  accepts_nested_attributes_for :school


  def upload_flickr_photos
    self.school.upload_flickr_photo
    self.school.principal_detail.upload_flickr_photo
  end

end
