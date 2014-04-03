class Users::RegistrationsController < Devise::RegistrationsController
  #http_basic_authenticate_with name: "sm", password: "sm$007"
  # POST /resource
  def create
    build_resource
    @user = User.new(user_params)

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        #render js: %(window.location.href='#{after_sign_up_path_for(resource)}')
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        #render js: %(window.location.href='#{after_inactive_sign_up_path_for(resource)}')
      end

      respond_to do |format|
        format.html { redirect_to root_path }
      end

    else
      clean_up_passwords resource
      @error_fields = resource.errors.messages
      respond_to do |format|
        format.js { render :action => :new }
        format.html { render :action => :new }
      end
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :provider, :password_confirmation)
  end

end