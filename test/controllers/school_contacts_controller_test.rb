require 'test_helper'

class SchoolContactsControllerTest < ActionController::TestCase
  setup do
    @school_contact = school_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:school_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school_contact" do
    assert_difference('SchoolContact.count') do
      post :create, school_contact: { school_id: @school_contact.school_id, schoold_role_id: @school_contact.schoold_role_id, user_id: @school_contact.user_id }
    end

    assert_redirected_to school_contact_path(assigns(:school_contact))
  end

  test "should show school_contact" do
    get :show, id: @school_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @school_contact
    assert_response :success
  end

  test "should update school_contact" do
    patch :update, id: @school_contact, school_contact: { school_id: @school_contact.school_id, schoold_role_id: @school_contact.schoold_role_id, user_id: @school_contact.user_id }
    assert_redirected_to school_contact_path(assigns(:school_contact))
  end

  test "should destroy school_contact" do
    assert_difference('SchoolContact.count', -1) do
      delete :destroy, id: @school_contact
    end

    assert_redirected_to school_contacts_path
  end
end
