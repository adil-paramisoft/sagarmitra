class CreateSchoolMedia < ActiveRecord::Migration
  def change
    create_table :school_media do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
