require 'test_helper'

class ProgramUpdatesControllerTest < ActionController::TestCase
  setup do
    @program_update = program_updates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:program_updates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create program_update" do
    assert_difference('ProgramUpdate.count') do
      post :create, program_update: { from: @program_update.from, update_text: @program_update.update_text }
    end

    assert_redirected_to program_update_path(assigns(:program_update))
  end

  test "should show program_update" do
    get :show, id: @program_update
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @program_update
    assert_response :success
  end

  test "should update program_update" do
    patch :update, id: @program_update, program_update: { from: @program_update.from, update_text: @program_update.update_text }
    assert_redirected_to program_update_path(assigns(:program_update))
  end

  test "should destroy program_update" do
    assert_difference('ProgramUpdate.count', -1) do
      delete :destroy, id: @program_update
    end

    assert_redirected_to program_updates_path
  end
end
