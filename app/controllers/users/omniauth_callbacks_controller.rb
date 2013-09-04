class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  before_filter :set_redirection_url

  #TODO: we can re-factore these methods to one generic method

  def facebook
    Rails.logger.info "==========================================="
    Rails.logger.info params
    role = request.env["omniauth.params"]['role']
    Rails.logger.info "==========================================="
    #session[:user_return_to] = request.env['omniauth.origin']
    @user = ::User.find_for_facebook_oauth(request.env["omniauth.auth"], role, current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      #set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      flash[:success] = "You have been successfully logged in!"
    else
      flash[:notice] = "Something wrong! Please check again. May be you are already registered with other account"
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end


  def linkedin
    #session[:user_return_to] = request.env['omniauth.origin']
    @user = ::User.find_for_linkedin_oauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      flash[:success] = "You have been successfully logged in!"
    else
      flash[:notice] = "Something wrong! Please check again. May be you are already registered with other account"
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_url
    end
  end

  def gplus
    #session[:user_return_to] = request.env['omniauth.origin']
    @user = ::User.find_for_gplus_oauth(request.env["omniauth.auth"])
    if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication
        flash[:success] = "You have been successfully logged in!"
    else
      flash[:notice] = "Something wrong! Please check again. May be you are already registered with other account"
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_url
    end
  end

  def twitter
    #session[:user_return_to] = request.env['omniauth.origin']
    @user = ::User.find_for_twitter_oauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      flash[:success] = "You have been successfully logged in!"
    else
      flash[:notice] = "Something wrong! Please check again. May be you are already registered with other account"
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_url
    end
  end


  def set_redirection_url
   # session[:user_return_to] =  mission_path(Mission.first) #params[:redirect_url]  if params[:redirect_url]
  end


end