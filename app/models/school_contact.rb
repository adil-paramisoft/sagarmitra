class SchoolContact < ActiveRecord::Base
  belongs_to :school
  belongs_to :school_role
  belongs_to :user
  
end
