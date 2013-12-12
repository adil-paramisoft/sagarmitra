class SchoolRole < ActiveRecord::Base
  #validations
  validates :role , :description ,  
            :presence => true
end
