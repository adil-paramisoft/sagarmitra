class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :presented_by
      t.datetime :date
      t.integer :audience_count
      t.text :summary
      t.text :authorities_present
      t.integer :presentation_type_id
      t.integer :school_id
      t.string :followup_volunteer
      t.integer :followup_volunteer_mno

      t.timestamps
    end
  end
end
