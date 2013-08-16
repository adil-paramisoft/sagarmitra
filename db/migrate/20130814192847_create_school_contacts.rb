class CreateSchoolContacts < ActiveRecord::Migration
  def change
    create_table :school_contacts do |t|
      t.integer :school_id
      t.integer :user_id
      t.integer :schoold_role_id

      t.timestamps
    end
  end
end
