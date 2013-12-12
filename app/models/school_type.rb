class SchoolType < ActiveRecord::Base
  #validations
  validates :name , :description ,  
            :presence => true
end
