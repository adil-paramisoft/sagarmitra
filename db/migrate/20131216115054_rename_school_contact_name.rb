class RenameSchoolContactName < ActiveRecord::Migration
  def change
    rename_column :school_contacts, :schoold_role_id, :school_role_id
  end
end
