class PresentationType < ActiveRecord::Base
  has_many :presentations
  # validations
  validates :name, :description,
            :presence => true
end
