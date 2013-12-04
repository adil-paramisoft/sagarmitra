class RemovedatecolounmfromplasticcollectionandPresentation < ActiveRecord::Migration
  def change
    remove_column :plastic_collection_events, :date
    remove_column :presentations, :date
  end
end
