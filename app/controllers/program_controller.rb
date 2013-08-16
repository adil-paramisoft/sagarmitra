class ProgramController < ApplicationController
  def index
     logger.info  request.inspect
     @program_name = "SagarMitra!"
  end
  
end
