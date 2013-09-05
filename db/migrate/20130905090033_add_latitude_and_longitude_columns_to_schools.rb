class AddLatitudeAndLongitudeColumnsToSchools < ActiveRecord::Migration
  def change
    change_table :schools do |t|
      t.decimal :lat, :precision => 15, :scale => 10
      t.decimal :lng, :precision => 15, :scale => 10
    end
  end
end
