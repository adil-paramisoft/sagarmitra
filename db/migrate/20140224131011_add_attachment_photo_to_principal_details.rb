class AddAttachmentPhotoToPrincipalDetails < ActiveRecord::Migration
  def self.up
    change_table :principal_details do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :principal_details, :photo
  end
end
