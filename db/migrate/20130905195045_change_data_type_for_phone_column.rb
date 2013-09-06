class ChangeDataTypeForPhoneColumn < ActiveRecord::Migration
  def up
    change_column :users, :mobile_number, :string, :null => true, :limit => 15
    change_column :program_volunteers, :mobile, :string, :null => true, :limit => 15
    change_column :school_volunteers, :mobile, :string, :null => true, :limit => 15
    change_column :plastic_collection_sources, :phone_no_1, :string, :null => true, :limit => 15
    change_column :plastic_collection_sources, :phone_no_2, :string, :null => true, :limit => 15
  end

  def down
    change_column :users, :mobile_number, :integer
    change_column :program_volunteers, :mobile, :integer
    change_column :school_volunteers, :mobile, :integer
    change_column :plastic_collection_sources, :integer
    change_column :plastic_collection_sources, :integer
  end
end
