class Users::RegistrationsController < Devise::RegistrationsController
 #http_basic_authenticate_with name: "sm", password: "sm$007"
  # POST /resource
  def create
    build_resource

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        render js: %(window.location.href='#{after_sign_up_path_for(resource)}')
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        render js: %(window.location.href='#{after_inactive_sign_up_path_for(resource)}')
      end
    else
      clean_up_passwords resource
      @error_fields = resource.errors.messages
      respond_to do |format|
        format.js { render :action => :new }
        format.html { render :action => :new  }
      end
    end
  end

end