class ProgramState < ActiveRecord::Base
    validates :name , :description ,  :presence => true
end
