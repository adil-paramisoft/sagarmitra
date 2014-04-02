class RemoveAttachmentPhotosFromPrincipalDetails < ActiveRecord::Migration

  def self.up
    drop_attached_file :principal_details, :photo
  end

  def self.down
    change_table :principal_details do |t|
      t.attachment :photo
    end
  end

end
