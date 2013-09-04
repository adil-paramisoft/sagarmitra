class CreateProgramVolunteers < ActiveRecord::Migration
  def change
    create_table :program_volunteers do |t|
      t.string :name
      t.text :interest
      t.text :responsibility
      t.string :email
      t.integer :mobile

      t.timestamps
    end
  end
end
