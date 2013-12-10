module ApplicationHelper
   
  #require 'open-uri'
  def provider_label(name)
    if name.eql?(:gplus)
      return "Google +"
    else
      return name.to_s.titleize
    end
  end
  
  def user_profile_link
    #if current_user.role? :organization
      link_to("#{current_user.name}", root_path, :class => 'decoration')
    #end
  end
  
 
  
end
