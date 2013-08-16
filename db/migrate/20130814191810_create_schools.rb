class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.text :address
      t.integer :school_type_id
      t.integer :program_state_id
      t.integer :total_students
      t.integer :medium_id

      t.timestamps
    end
  end
end
