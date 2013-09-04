class AssociateSchoolVolunteerWithSchool < ActiveRecord::Migration
  def change
    remove_column :school_volunteers , :school_name , :string
    remove_column :school_volunteers , :school_address , :text
    remove_column :school_volunteers , :school_medium_id , :integer
    remove_column :school_volunteers , :no_of_students , :integer
    remove_column :school_volunteers , :school_type_id , :integer
    remove_column :school_volunteers , :user_id , :integer
    
    add_column :school_volunteers , :school_id , :integer
    add_column :school_volunteers , :name , :string
    add_column :school_volunteers , :email , :string
    add_column :school_volunteers , :mobile , :string
    

  end
end
