class RenameSchoolMedium < ActiveRecord::Migration
  def change
    rename_column :schools, :medium_id, :school_medium_id
  end
end
