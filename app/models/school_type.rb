class SchoolType < ActiveRecord::Base
  validates :name , :description ,  :presence => true
end
