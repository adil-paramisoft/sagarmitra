class RemoveAttachmentImageFromSchools < ActiveRecord::Migration

  def self.up
    drop_attached_file :schools, :image
  end

  def self.down
    change_table :schools do |t|
      t.attachment :image
    end
  end

end
