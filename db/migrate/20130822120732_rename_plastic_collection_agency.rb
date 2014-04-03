class RenamePlasticCollectionAgency < ActiveRecord::Migration
  def change
    rename_column :plastic_collection_events, :plastic_collection_agency_id, :plastic_collection_source_id

  end
end
