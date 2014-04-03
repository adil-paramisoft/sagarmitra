require 'test_helper'

class ProgramStatesControllerTest < ActionController::TestCase
  setup do
    @program_state = program_states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:program_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create program_state" do
    assert_difference('ProgramState.count') do
      post :create, program_state: {description: @program_state.description, name: @program_state.name}
    end

    assert_redirected_to program_state_path(assigns(:program_state))
  end

  test "should show program_state" do
    get :show, id: @program_state
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @program_state
    assert_response :success
  end

  test "should update program_state" do
    patch :update, id: @program_state, program_state: {description: @program_state.description, name: @program_state.name}
    assert_redirected_to program_state_path(assigns(:program_state))
  end

  test "should destroy program_state" do
    assert_difference('ProgramState.count', -1) do
      delete :destroy, id: @program_state
    end

    assert_redirected_to program_states_path
  end
end
