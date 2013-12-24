class Admin::RolesUsersController < ApplicationController
  load_and_authorize_resource
  before_filter :verify_admin
end
