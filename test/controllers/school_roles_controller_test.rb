require 'test_helper'

class SchoolRolesControllerTest < ActionController::TestCase
  setup do
    @school_role = school_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:school_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school_role" do
    assert_difference('SchoolRole.count') do
      post :create, school_role: { description: @school_role.description, role: @school_role.role }
    end

    assert_redirected_to school_role_path(assigns(:school_role))
  end

  test "should show school_role" do
    get :show, id: @school_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @school_role
    assert_response :success
  end

  test "should update school_role" do
    patch :update, id: @school_role, school_role: { description: @school_role.description, role: @school_role.role }
    assert_redirected_to school_role_path(assigns(:school_role))
  end

  test "should destroy school_role" do
    assert_difference('SchoolRole.count', -1) do
      delete :destroy, id: @school_role
    end

    assert_redirected_to school_roles_path
  end
end
