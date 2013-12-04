class Addplasticcollectioneventeventstartatandendat < ActiveRecord::Migration
  def change
    add_column :plastic_collection_events, :start_at, :datetime
    add_column :plastic_collection_events, :end_at, :datetime
  end
end
