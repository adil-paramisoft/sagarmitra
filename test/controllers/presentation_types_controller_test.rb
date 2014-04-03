require 'test_helper'

class PresentationTypesControllerTest < ActionController::TestCase
  setup do
    @presentation_type = presentation_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:presentation_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create presentation_type" do
    assert_difference('PresentationType.count') do
      post :create, presentation_type: {description: @presentation_type.description, name: @presentation_type.name}
    end

    assert_redirected_to presentation_type_path(assigns(:presentation_type))
  end

  test "should show presentation_type" do
    get :show, id: @presentation_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @presentation_type
    assert_response :success
  end

  test "should update presentation_type" do
    patch :update, id: @presentation_type, presentation_type: {description: @presentation_type.description, name: @presentation_type.name}
    assert_redirected_to presentation_type_path(assigns(:presentation_type))
  end

  test "should destroy presentation_type" do
    assert_difference('PresentationType.count', -1) do
      delete :destroy, id: @presentation_type
    end

    assert_redirected_to presentation_types_path
  end
end
