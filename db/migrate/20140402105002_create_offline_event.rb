class CreateOfflineEvent < ActiveRecord::Migration
  def change
    create_table :offline_events do |t|
      t.string :school_name
      t.text :school_address
      t.string :event_name
      t.text :event_description
      t.datetime :start_at
      t.datetime :end_at
      t.text :volunteers_present
    end
  end
end
