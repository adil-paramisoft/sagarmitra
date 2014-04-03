class PrincipalDetail < ActiveRecord::Base

  # Associations
  belongs_to :school
  has_one :photo, as: :imageable, dependent: :destroy, class_name: ::Photo

  # Nested attributes
  accepts_nested_attributes_for :photo, allow_destroy: true


  def upload_flickr_photo
    if self.photo.flickr_photo_id.present?
      self.photo.replace_flickr_photo
    else
      self.photo.upload_flickr_photo
    end
  end

end
