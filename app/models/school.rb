class School < ActiveRecord::Base
  has_one :plastic_collection_source
  has_many :presentations
  has_many :plastic_collection_events
  belongs_to :program_state
  belongs_to :school_type
  belongs_to :school_medium
  
  validates :school_medium_id , :program_state_id , :school_type_id , :total_students , :name , :address , :presence => true
  
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
 
end
