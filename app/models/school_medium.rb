class SchoolMedium < ActiveRecord::Base
    #validations
    validates :name , :description ,  
              :presence => true
end
