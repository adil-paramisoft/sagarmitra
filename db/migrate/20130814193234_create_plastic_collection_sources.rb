class CreatePlasticCollectionSources < ActiveRecord::Migration
  def change
    create_table :plastic_collection_sources do |t|
      t.string :name
      t.text :address
      t.string :contact_person
      t.integer :phone_no_1
      t.integer :phone_no_2
      t.string :website
      t.string :eamil

      t.timestamps
    end
  end
end
