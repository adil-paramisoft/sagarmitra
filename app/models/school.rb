require 'net/http'
require 'uri'

class School < ActiveRecord::Base
  include GeoKit::Geocoders

  # Associations
  has_one :plastic_collection_source
  has_many :presentations
  has_many :plastic_collection_events
  belongs_to :program_state
  belongs_to :school_type
  belongs_to :school_medium
  
  validates :school_medium_id , :program_state_id , :school_type_id , :total_students , :name , :address , :presence => true

  # Geokit
  acts_as_mappable

  before_save :set_location

  
  def plastic_collection_details
     plastic_collected = green_fund = 0 
     self.plastic_collection_events.each do |event|
       plastic_collected = plastic_collected + event.plastic_weight
       green_fund = green_fund + event.money_given
     end
     return {:plastic_collected =>  plastic_collected , :green_fund => green_fund }
  end
  
 def plastic_collected
    plastic_collected = 0
    self.plastic_collection_events.each do |event|
      plastic_collected = plastic_collected + event.plastic_weight
    end
    return plastic_collected
 end
 
 def green_fund
    green_fund = 0
     self.plastic_collection_events.each do |event|
       green_fund = green_fund + event.money_given
     end
     return green_fund
 end

private
  def set_location
    url_str = URI.escape "http://maps.googleapis.com/maps/api/geocode/json?address=#{self.address}&sensor=true"
    url = URI.parse(url_str)
    Rails.logger.info "[API REQUEST URL (GET)] #{url}"
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true if url.scheme == 'https'
    new_request = Net::HTTP::Get.new(url.request_uri)
    response = http.request(new_request)
    json_response = JSON.parse(response.body)
    codes = json_response['results'].first['geometry']['location'] rescue nil
    latitude, longitude = codes['lat'], codes['lng'] rescue nil

    if [latitude, longitude]
      self.lat, self.lng = latitude, longitude
    end

  end
 
end
