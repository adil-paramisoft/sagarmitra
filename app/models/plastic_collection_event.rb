class PlasticCollectionEvent < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  # Associations
  has_event_calendar
  has_many :photos, as: :imageable, dependent: :destroy, class_name: ::Photo

  # Filters
  belongs_to :school
  belongs_to :plastic_collection_source

  # Nested attributes 
  accepts_nested_attributes_for :photos, allow_destroy: true


  #validations
  validates :school_id, :plastic_collection_source_id, :start_at, :end_at, :plastic_weight, :plastic_weight, :volunteers_present,
            :presence => true
  validates :money_given, :plastic_weight,
            :numericality => {:greater_than_or_equal_to => 0}


  def name
    self.school.name
  end

  def color
    'Green'
  end


  def self.metadata
   plastic_collection_metadata= PlasticCollectionEvent.select("SUM(money_given) as green_fund, SUM(plastic_weight) as total_plastic").group("id")
logger.info("++++++++")
logger.info(plastic_collection_metadata.first.inspect)
logger.info("++++++++")


return plastic_collection_metadata
  end


  def upload_flickr_photos
    self.photos.each do |photo|
      if photo.flickr_photo_id.present?
        photo.replace_flickr_photo
      else
        photo.upload_flickr_photo
      end
    end
  end

end
