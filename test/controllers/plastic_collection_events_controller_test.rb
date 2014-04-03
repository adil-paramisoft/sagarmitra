require 'test_helper'

class PlasticCollectionEventsControllerTest < ActionController::TestCase
  setup do
    @plastic_collection_event = plastic_collection_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plastic_collection_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plastic_collection_event" do
    assert_difference('PlasticCollectionEvent.count') do
      post :create, plastic_collection_event: {date: @plastic_collection_event.date, feedback: @plastic_collection_event.feedback, money_given: @plastic_collection_event.money_given, plastic_collection_agency_id: @plastic_collection_event.plastic_collection_agency_id, plastic_weight: @plastic_collection_event.plastic_weight, quality_remark: @plastic_collection_event.quality_remark, school_id: @plastic_collection_event.school_id, volunteers_present: @plastic_collection_event.volunteers_present}
    end

    assert_redirected_to plastic_collection_event_path(assigns(:plastic_collection_event))
  end

  test "should show plastic_collection_event" do
    get :show, id: @plastic_collection_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plastic_collection_event
    assert_response :success
  end

  test "should update plastic_collection_event" do
    patch :update, id: @plastic_collection_event, plastic_collection_event: {date: @plastic_collection_event.date, feedback: @plastic_collection_event.feedback, money_given: @plastic_collection_event.money_given, plastic_collection_agency_id: @plastic_collection_event.plastic_collection_agency_id, plastic_weight: @plastic_collection_event.plastic_weight, quality_remark: @plastic_collection_event.quality_remark, school_id: @plastic_collection_event.school_id, volunteers_present: @plastic_collection_event.volunteers_present}
    assert_redirected_to plastic_collection_event_path(assigns(:plastic_collection_event))
  end

  test "should destroy plastic_collection_event" do
    assert_difference('PlasticCollectionEvent.count', -1) do
      delete :destroy, id: @plastic_collection_event
    end

    assert_redirected_to plastic_collection_events_path
  end
end
