require 'net/http'
require 'uri'

class School < ActiveRecord::Base
  #  include GeoKit::Geocoders

  # Associations
  has_one :plastic_collection_source
  has_many :presentations
  has_many :plastic_collection_events
  belongs_to :program_state
  belongs_to :school_type
  belongs_to :school_medium

  validates :school_medium_id , :program_state_id , :school_type_id , :total_students , :name , :address , :presence => true

  # Geokit
  # acts_as_mappable

  before_save :set_location


  def plastic_collection_details
    plastic_collected = green_fund = 0 
    self.plastic_collection_events.each do |event|
      plastic_collected = plastic_collected + event.plastic_weight
      green_fund = green_fund + event.money_given
    end
    return {:plastic_collected =>  plastic_collected , :green_fund => green_fund }
  end

  
 #def plastic_collected
 #   plastic_collected = 0
 #   self.plastic_collection_events.each do |event|
 #     plastic_collected = plastic_collected + event.plastic_weight
 #   end
 #   return plastic_collected
 #end
 
 #def green_fund
 #   green_fund = 0
 #    self.plastic_collection_events.each do |event|
 #      green_fund = green_fund + event.money_given
 #    end
 #    return green_fund
 #end


  def School.add_last_year_records
    School.where(:name => 'St. Andrews Chinchwad', 
    :address => 'Block D 3, MIDC, Chinchwad, Pune - 411033',
    :number_of_collections => 5 ,
    :plastic_collected => 1599 , 
    :green_fund => 12792 ,
    :school_type_id => 2,
    :program_state_id => 9,
    :school_medium_id => 1,
    :total_students => 2000).first_or_create
    
    School.where(:name => 'St. Ursulas Nigdi', 
    :address => 'Akurdi, Pune - 411035',
    :number_of_collections => 7 ,
    :plastic_collected => 1016 , 
    :green_fund => 8121 ,
    :school_type_id => 2,
    :program_state_id => 9,
    :school_medium_id => 1,
    :total_students => 2000).first_or_create
    
    School.where(:name => 'St. Vincent’s – Camp', 
    :address => 'Survey No 2005/2006, Near Shivaji Market, St Vincents Street, Camp, Pune - 411001',
    :number_of_collections => 4 ,
    :plastic_collected => 796 , 
    :green_fund => 6368 ,
    :school_type_id => 2,
    :program_state_id => 9,
    :school_medium_id => 1,
    :total_students => 2000).first_or_create

    School.where(:name => 'Paranjape School - Kothrud ', 
    :address => 'Survey No 40 Hissa No 1 To 3, Near Kothrud Telephone Exchange, Kothrud Depot, Pune - 411038',
    :number_of_collections => 6,
    :plastic_collected => 443 , 
    :green_fund => 3544 ,
    :school_type_id => 2,
    :program_state_id => 9,
    :school_medium_id => 1,
    :total_students => 2000).first_or_create
    
    School.where(:name => 'Mahesh Vidyalaya- Kothrud', 
    :address => 'Survey No 50 15/2 Nalawade Baug Gananjay Society, Near Springfield Society Opposite Ashish Garden, New D P Road, Kothrud Depot, Pune - 411038',
    :number_of_collections => 3 ,
    :plastic_collected => 112 , 
    :green_fund => 896 ,
    :school_type_id => 2,
    :program_state_id => 9,
    :school_medium_id => 1,
    :total_students => 800).first_or_create
    
  
    School.where(:name => 'Vidyaniketan School - Kothrud', 
    :address => 'Survey No 634/9 A/1, Bibvewadi, Pune - 411037',
    :number_of_collections => 2 ,
    :plastic_collected => 89 , 
    :green_fund => 712 ,
    :school_type_id => 2,
    :program_state_id => 9,
    :school_medium_id => 1,
    :total_students => 800).first_or_create


    School.where(:name => 'Saraswati Mandir ', 
    :address => '1359, Bajirao Rd, Shukrawar Peth, Pune - 411002',
    :number_of_collections => 2 ,
    :plastic_collected => 89 , 
    :green_fund => 712 ,
    :school_type_id => 2,
    :program_state_id => 9,
    :school_medium_id => 1,
    :total_students => 800).first_or_create
    
    School.where(:name => 'Modern High School Nigadi', 
    :address => 'Modern High School English Medium, Nigdi, Pune-411044',
    :number_of_collections => 1 ,
    :plastic_collected => 125 , 
    :green_fund => 1000 ,
    :school_type_id => 2,
    :program_state_id => 9,
    :school_medium_id => 1,
    :total_students => 850).first_or_create
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
