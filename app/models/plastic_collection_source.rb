class PlasticCollectionSource < ActiveRecord::Base
  belongs_to :plastic_collection_event
  #validations
  validates :name, :address, :contact_person, :phone_no_1,
            :presence => true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness:  true
  validates :phone_no_1, format: {with: /\d{10}/, message: "bad format"}
  validates :phone_no_2, format: {with: /\d{10}/, message: "bad format"},
            allow_blank: true
  validates :phone_no_1, :phone_no_2,
            :numericality => {:greater_than_or_equal_to => 0}, allow_blank: true
  validates :website, :format => {:with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix}


end
