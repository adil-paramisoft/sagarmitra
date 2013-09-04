class UsersController < ApplicationController
  respond_to :html, :json

  def profile
    @user = current_user
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.json { respond_with_bip(@user) }
      else
        format.json { respond_with_bip(@user) }
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
