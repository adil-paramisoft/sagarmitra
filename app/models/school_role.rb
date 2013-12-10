class SchoolRole < ActiveRecord::Base
  validates :role , :description ,  :presence => true
end
