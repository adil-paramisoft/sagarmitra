class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :imageable_type, limit: 30
      t.integer :imageable_id
      t.integer :flickr_photo_id, limit: 8
      t.string :image_file_name
      t.string :image_content_type
      t.string :title, limit: 100
      t.string :description
      t.timestamps
    end

    add_index :photos, :flickr_photo_id

  end
end
