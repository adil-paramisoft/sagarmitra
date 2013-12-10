class SchoolMedium < ActiveRecord::Base
    validates :name , :description ,  :presence => true
end
