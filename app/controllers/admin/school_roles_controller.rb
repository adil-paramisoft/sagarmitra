class Admin::SchoolRolesController < ApplicationController
  #before_action :set_school_role, only: [:show, :edit, :update, :destroy]
  before_action :load_school_role, only: :create
  load_and_authorize_resource
  before_filter :verify_admin
  # GET /school_roles
  # GET /school_roles.json
  def index
    @school_roles = SchoolRole.all
  end

  # GET /school_roles/1
  # GET /school_roles/1.json
  def show
  end

  # GET /school_roles/new
  def new
    @school_role = SchoolRole.new
  end

  # GET /school_roles/1/edit
  def edit
  end

  # POST /school_roles
  # POST /school_roles.json
  def create
    @school_role = SchoolRole.new(school_role_params)

    respond_to do |format|
      if @school_role.save
        format.html { redirect_to admin_school_role_path(@school_role), notice: 'School role was successfully created.' }
        format.json { render action: 'show', status: :created, location: @school_role }
      else
        format.html { render action: 'new' }
        format.json { render json: @school_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_roles/1
  # PATCH/PUT /school_roles/1.json
  def update
    respond_to do |format|
      if @school_role.update(school_role_params)
        format.html { redirect_to admin_school_role_path(@school_role), notice: 'School role was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @school_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_roles/1
  # DELETE /school_roles/1.json
  def destroy
    @school_role.destroy
    respond_to do |format|
      format.html { redirect_to admin_school_roles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_role
      @school_role = SchoolRole.find(params[:id])
    end

    def load_school_role
      @school_role = SchoolRole.new(school_role_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_role_params
      params.require(:school_role).permit(:role, :description)
    end
end
