class AddAttachmentImageToSchools < ActiveRecord::Migration
  def self.up
    change_table :schools do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :schools, :image
  end
end
