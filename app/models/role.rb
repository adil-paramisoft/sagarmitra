class Role < ActiveRecord::Base
  # Associations
  has_and_belongs_to_many :users
  #validations
    validates :name , :description ,  :presence => true
end
