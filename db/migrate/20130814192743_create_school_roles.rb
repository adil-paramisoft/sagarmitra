class CreateSchoolRoles < ActiveRecord::Migration
  def change
    create_table :school_roles do |t|
      t.string :role
      t.string :description

      t.timestamps
    end
  end
end
