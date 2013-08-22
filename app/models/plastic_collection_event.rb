class PlasticCollectionEvent < ActiveRecord::Base
  belongs_to :school
  belongs_to :plastic_collection_source
end
