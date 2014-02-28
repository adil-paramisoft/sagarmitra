class PrincipalDetail < ActiveRecord::Base
	belongs_to :school

	 has_attached_file :photo,
                      :styles => {  :small => '100x100>', :display => '240x240>' },
                      :default_style => :display,
                      :url => '/principal_details/:id/:style/:basename.:extension',
                      :path => ':rails_root/public/principal_details/:id/:style/:basename.:extension'
                      
validates_attachment_content_type :photo, :content_type => %w(image/jpeg image/jpg image/png)                            
end
