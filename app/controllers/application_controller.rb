class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_program_name
  
  private
  
  def get_program_name
    
    # TODO extract domain name from the request and check the core DB for program name
    
    # logger.info  request.inspect
    
     @program_name = "SagarMitra!"
  end
end
