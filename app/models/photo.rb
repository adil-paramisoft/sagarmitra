require 'flickr_gateway'
class Photo < ActiveRecord::Base


  # Associations
  belongs_to :imageable, :polymorphic => true


  Paperclip.interpolates :attached_to do |attachment, style|
    attachment.instance.imageable.class.to_s.downcase
  end

  # Paperclip settings
  has_attached_file :image, path: ':rails_root/public/:attached_to/:basename.:extension', url: '/:attached_to/:basename.:extension'

  validates_attachment :image, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png"]}

  def flickr_url
    FlickrGateway.url_for self.flickr_photo_id
  end

  def download_from_flickr
    FlickrGateway.download self.flickr_photo_id, self.image_file_name
  end

  def upload_flickr_photo
    img_path = Rails.root.to_s + '/public' + self.image.url

    Rails.logger.info "upload_flickr_photo===================================="
    Rails.logger.info img_path.inspect
    Rails.logger.info "upload_flickr_photo===================================="
    if File.exists? img_path
      Rails.logger.info "in if===================================="
      flickr_response = FlickrGateway.upload img_path, self.title, self.description
      self.update_attribute :flickr_photo_id, flickr_response
      File.delete img_path
    end
  end

  def replace_flickr_photo
    img_path = Rails.root.to_s + '/public' + self.image.url
    Rails.logger.info "replace_flickr_photo===================================="
    Rails.logger.info img_path.inspect
    Rails.logger.info "replace_flickr_photo===================================="
    if File.exists? img_path
      flickr_response = FlickrGateway.replace img_path, self.flickr_photo_id
      Rails.logger.info "-------------------------------------------"
      Rails.logger.info flickr_response.inspect
      Rails.logger.info "-------------------------------------------"
      #self.update_attribute :flickr_photo_id, flickr_response
      File.delete img_path
    end
  end

  def delete_flickr_photo
    FlickrGateway.delete self.flickr_photo_id
  end

end
