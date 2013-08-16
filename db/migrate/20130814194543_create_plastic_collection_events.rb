class CreatePlasticCollectionEvents < ActiveRecord::Migration
  def change
    create_table :plastic_collection_events do |t|
      t.float :plastic_weight
      t.float :money_given
      t.text :volunteers_present
      t.integer :plastic_collection_agency_id
      t.datetime :date
      t.string :quality_remark
      t.text :feedback
      t.integer :school_id

      t.timestamps
    end
  end
end
