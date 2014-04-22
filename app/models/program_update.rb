class ProgramUpdate < ActiveRecord::Base
  include PublicActivity::Model
  tracked
end
