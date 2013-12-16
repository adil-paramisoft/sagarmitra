class SchoolContactsController < ApplicationController
  #before_action :set_school_contact, only: [:show, :edit, :update, :destroy]
  before_action :load_school_contact, only: :create
  load_and_authorize_resource
  # GET /school_contacts
  # GET /school_contacts.json
  def index
    @school_contacts = SchoolContact.all
  end

  # GET /school_contacts/1
  # GET /school_contacts/1.json
  def show
  end

  # GET /school_contacts/new
  def new
    @school_contact = SchoolContact.new
  end

  # GET /school_contacts/1/edit
  def edit
  end

  # POST /school_contacts
  # POST /school_contacts.json
  def create
    @school_contact = SchoolContact.new(school_contact_params)

    respond_to do |format|
      if @school_contact.save
        format.html { redirect_to @school_contact, notice: 'School contact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @school_contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @school_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_contacts/1
  # PATCH/PUT /school_contacts/1.json
  def update
    respond_to do |format|
      if @school_contact.update(school_contact_params)
        format.html { redirect_to @school_contact, notice: 'School contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @school_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_contacts/1
  # DELETE /school_contacts/1.json
  def destroy
    @school_contact.destroy
    respond_to do |format|
      format.html { redirect_to school_contacts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_contact
      @school_contact = SchoolContact.find(params[:id])
    end

    def load_school_contact
         @school_contact = SchoolContact.new(school_contact_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_contact_params
      params.require(:school_contact).permit(:school_id, :user_id, :school_role_id)
    end
end
