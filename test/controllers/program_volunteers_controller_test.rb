require 'test_helper'

class ProgramVolunteersControllerTest < ActionController::TestCase
  setup do
    @program_volunteer = program_volunteers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:program_volunteers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create program_volunteer" do
    assert_difference('ProgramVolunteer.count') do
      post :create, program_volunteer: { email: @program_volunteer.email, interest: @program_volunteer.interest, mobile: @program_volunteer.mobile, name: @program_volunteer.name, responsibility: @program_volunteer.responsibility }
    end

    assert_redirected_to program_volunteer_path(assigns(:program_volunteer))
  end

  test "should show program_volunteer" do
    get :show, id: @program_volunteer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @program_volunteer
    assert_response :success
  end

  test "should update program_volunteer" do
    patch :update, id: @program_volunteer, program_volunteer: { email: @program_volunteer.email, interest: @program_volunteer.interest, mobile: @program_volunteer.mobile, name: @program_volunteer.name, responsibility: @program_volunteer.responsibility }
    assert_redirected_to program_volunteer_path(assigns(:program_volunteer))
  end

  test "should destroy program_volunteer" do
    assert_difference('ProgramVolunteer.count', -1) do
      delete :destroy, id: @program_volunteer
    end

    assert_redirected_to program_volunteers_path
  end
end
