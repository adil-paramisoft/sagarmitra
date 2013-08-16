class CreateSchoolPlasticCollectionSources < ActiveRecord::Migration
  def change
    create_table :school_plastic_collection_sources do |t|
      t.integer :schoold_id
      t.integer :plastic_collection_source

      t.timestamps
    end
  end
end
