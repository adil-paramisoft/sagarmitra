require 'flickraw'

module FlickrGateway

  def self.login
    FlickRaw.api_key="d1656a679a6bfcc7feef08ed3902edac"
    FlickRaw.shared_secret="8d7c91a1743c7078"

    flickr.access_token = "72157641647294563-cb316fbc058ee06e"
    flickr.access_secret = "0ca08eb869d90a46"

    # From here you are logged
    login = flickr.test.login
  end

  def self.upload image_path, title, description
    login

    return flickr.upload_photo image_path, title: title, description: description
  end

  def self.replace image_path, flickr_photo_id
    login

    Rails.logger.info "-----------------------------------"
    Rails.logger.info image_path
    Rails.logger.info flickr_photo_id
    Rails.logger.info "-----------------------------------"

    return flickr.replace_photo image_path, photo_id: flickr_photo_id
  end

  def self.url_for flickr_photo_id
    login

    photo_info = flickr.photos.getInfo(:photo_id => flickr_photo_id)
    return FlickRaw.url_b(photo_info)
  end

  def self.download flickr_photo_id, file_name
    login

    photo_info = flickr.photos.getInfo(:photo_id => flickr_photo_id)
    photo_url = FlickRaw.url_b(photo_info)

    puts "Downloading #{photo_url}"

    open(Rails.root.to_s + "/public/" + file_name, "wb") { |file|
      file.write(Net::HTTP.get_response(URI.parse(photo_url)).body)
    }

    return Rails.root.to_s + "/public" + file_name
  end

  def self.delete photo_id

  end

end


#  def self.upload_photo
#  FlickRaw.api_key="d1656a679a6bfcc7feef08ed3902edac"
#  FlickRaw.shared_secret="8d7c91a1743c7078"
#
#  flickr.access_token = "72157641647294563-cb316fbc058ee06e"
#  flickr.access_secret = "0ca08eb869d90a46"
#
#  # From here you are logged:
#  login = flickr.test.login
#
# photo_info = flickr.photos.getInfo(:photo_id => 12832191373)
# photo_url = FlickRaw.url_b(photo_info)
#
# puts "Downloading #{photo_url}"
#
# open(Rails.root.to_s + "/public/" + "12832191373" + ".jpg", "wb") { |file|
#  file.write(Net::HTTP.get_response(URI.parse(photo_url)).body)
# }
#end
#
#
#  def self.upload_photo
#  FlickRaw.api_key="d1656a679a6bfcc7feef08ed3902edac"
#  FlickRaw.shared_secret="8d7c91a1743c7078"
#
#  token = flickr.get_request_token
#  auth_url = flickr.get_authorize_url(token['oauth_token'], :perms => 'delete')
#
#  Rails.logger.info "Open this url in your process to complete the authication process : #{auth_url}"
#  Rails.logger.info "Copy here the number given when you complete the process."
#  verify = gets.strip
#
#
#  photo_path = Rails.root.to_s + '/app/assets/images/schools/modern_school.jpg'
#
#  Rails.logger.info "-------------------------------------"
#  Rails.logger.info "/Users/chetan/programming/apps/sagarmitra/app/assets/images/schools/modern_school.jpg"
#  Rails.logger.info "-------------------------------------"
#
#  # You need to be authentified to do that, see the previous examples.
#  res = flickr.upload_photo photo_path, :title => "Title", :description => "This is the description"
#
#  Rails.logger.info "-------------------------------------"
#  Rails.logger.info "12832191373"
#  Rails.logger.info "-------------------------------------"
#end
#  end

