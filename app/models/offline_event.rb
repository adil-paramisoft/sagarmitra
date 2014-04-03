class OfflineEvent < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  # Associations
  has_event_calendar


  #validations
  validates :school_name  , :school_address, :event_name, :event_description, :start_at,:end_at, :volunteers_present,
            :presence => true




end
