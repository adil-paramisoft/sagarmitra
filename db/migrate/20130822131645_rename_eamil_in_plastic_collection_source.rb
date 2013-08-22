class RenameEamilInPlasticCollectionSource < ActiveRecord::Migration
  def change
     rename_column :plastic_collection_sources, :eamil, :email
     
  end
end
