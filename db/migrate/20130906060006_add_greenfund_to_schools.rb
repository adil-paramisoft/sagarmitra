class AddGreenfundToSchools < ActiveRecord::Migration
  def change
    add_column :schools , :plastic_collected , :integer
    add_column :schools , :green_fund , :integer
    
  end
end
