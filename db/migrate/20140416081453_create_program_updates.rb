class CreateProgramUpdates < ActiveRecord::Migration
  def change
    create_table :program_updates do |t|
      t.string :update_text
      t.integer :from

      t.timestamps
    end
  end
end
