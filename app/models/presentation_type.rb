class PresentationType < ActiveRecord::Base
  has_many :presentations
  validates :name , :description ,  :presence => true
end
