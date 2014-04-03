require 'test_helper'

class SchoolVolunteersControllerTest < ActionController::TestCase
  setup do
    @school_volunteer = school_volunteers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:school_volunteers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school_volunteer" do
    assert_difference('SchoolVolunteer.count') do
      post :create, school_volunteer: {mobile: @school_volunteer.mobile, no_of_students: @school_volunteer.no_of_students, school_address: @school_volunteer.school_address, school_medium_id: @school_volunteer.school_medium_id, school_name: @school_volunteer.school_name, school_type_id: @school_volunteer.school_type_id, user_id: @school_volunteer.user_id, volunteer: @school_volunteer.volunteer}
    end

    assert_redirected_to school_volunteer_path(assigns(:school_volunteer))
  end

  test "should show school_volunteer" do
    get :show, id: @school_volunteer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @school_volunteer
    assert_response :success
  end

  test "should update school_volunteer" do
    patch :update, id: @school_volunteer, school_volunteer: {mobile: @school_volunteer.mobile, no_of_students: @school_volunteer.no_of_students, school_address: @school_volunteer.school_address, school_medium_id: @school_volunteer.school_medium_id, school_name: @school_volunteer.school_name, school_type_id: @school_volunteer.school_type_id, user_id: @school_volunteer.user_id, volunteer: @school_volunteer.volunteer}
    assert_redirected_to school_volunteer_path(assigns(:school_volunteer))
  end

  test "should destroy school_volunteer" do
    assert_difference('SchoolVolunteer.count', -1) do
      delete :destroy, id: @school_volunteer
    end

    assert_redirected_to school_volunteers_path
  end
end
