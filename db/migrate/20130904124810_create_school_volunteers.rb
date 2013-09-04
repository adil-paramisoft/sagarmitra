class CreateSchoolVolunteers < ActiveRecord::Migration
  def change
    create_table :school_volunteers do |t|
      t.string :school_name
      t.string :school_address
      t.integer :user_id
      t.integer :school_medium_id
      t.string :no_of_students
      t.boolean :volunteer
      t.integer :school_type_id
      t.integer :mobile

      t.timestamps
    end
  end
end
