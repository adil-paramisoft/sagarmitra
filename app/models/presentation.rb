class Presentation < ActiveRecord::Base
  belongs_to :presentation_type
  belongs_to :school
end
