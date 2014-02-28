class AddInOfficeSinceToPrincipalDetails < ActiveRecord::Migration
  def change
    add_column :principal_details, :in_office_since, :datetime
  end
end
