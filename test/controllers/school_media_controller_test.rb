require 'test_helper'

class SchoolMediaControllerTest < ActionController::TestCase
  setup do
    @school_medium = school_media(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:school_media)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school_medium" do
    assert_difference('SchoolMedium.count') do
      post :create, school_medium: {description: @school_medium.description, name: @school_medium.name}
    end

    assert_redirected_to school_medium_path(assigns(:school_medium))
  end

  test "should show school_medium" do
    get :show, id: @school_medium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @school_medium
    assert_response :success
  end

  test "should update school_medium" do
    patch :update, id: @school_medium, school_medium: {description: @school_medium.description, name: @school_medium.name}
    assert_redirected_to school_medium_path(assigns(:school_medium))
  end

  test "should destroy school_medium" do
    assert_difference('SchoolMedium.count', -1) do
      delete :destroy, id: @school_medium
    end

    assert_redirected_to school_media_path
  end
end
