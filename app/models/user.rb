class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  
  devise :omniauthable, :omniauth_providers => [:facebook]
  devise :database_authenticatable, :registerable,:rememberable
         #:recoverable, , :trackable, :validatable#, :confirmable
  
  
   
  # Associations
  
  has_and_belongs_to_many :roles       
  
  def self.find_for_facebook_oauth(auth, role, signed_in_resource=nil)
           user = User.where(:provider => auth.provider, :uid => auth.uid).first
           unless user
             user_name = auth.extra.raw_info.name || auth.info.email
             user = User.new(name: user_name,
                                provider: auth.provider,
                                uid: auth.uid,
                                email: (auth.info.email rescue ""),
                                mobile_number: (auth.info.phone rescue ""),
                                facebook_url: auth.info.urls['Facebook'],
                                #role: role,
                                password:Devise.friendly_token[0,20]
             )
            # user.skip_confirmation!
             user.save
           end
           user
  end
         
end