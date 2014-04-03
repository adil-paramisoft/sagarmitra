require 'test_helper'

class PresentationsControllerTest < ActionController::TestCase
  setup do
    @presentation = presentations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:presentations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create presentation" do
    assert_difference('Presentation.count') do
      post :create, presentation: {audience_count: @presentation.audience_count, authorities_present: @presentation.authorities_present, date: @presentation.date, followup_volunteer: @presentation.followup_volunteer, followup_volunteer_mno: @presentation.followup_volunteer_mno, presentation_type_id: @presentation.presentation_type_id, presented_by: @presentation.presented_by, school_id: @presentation.school_id, summary: @presentation.summary}
    end

    assert_redirected_to presentation_path(assigns(:presentation))
  end

  test "should show presentation" do
    get :show, id: @presentation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @presentation
    assert_response :success
  end

  test "should update presentation" do
    patch :update, id: @presentation, presentation: {audience_count: @presentation.audience_count, authorities_present: @presentation.authorities_present, date: @presentation.date, followup_volunteer: @presentation.followup_volunteer, followup_volunteer_mno: @presentation.followup_volunteer_mno, presentation_type_id: @presentation.presentation_type_id, presented_by: @presentation.presented_by, school_id: @presentation.school_id, summary: @presentation.summary}
    assert_redirected_to presentation_path(assigns(:presentation))
  end

  test "should destroy presentation" do
    assert_difference('Presentation.count', -1) do
      delete :destroy, id: @presentation
    end

    assert_redirected_to presentations_path
  end
end
