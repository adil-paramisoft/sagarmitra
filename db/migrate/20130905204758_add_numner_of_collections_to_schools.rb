class AddNumnerOfCollectionsToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :number_of_collections, :integer
  end
end
