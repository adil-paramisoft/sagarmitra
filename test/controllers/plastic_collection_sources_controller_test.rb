require 'test_helper'

class PlasticCollectionSourcesControllerTest < ActionController::TestCase
  setup do
    @plastic_collection_source = plastic_collection_sources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plastic_collection_sources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plastic_collection_source" do
    assert_difference('PlasticCollectionSource.count') do
      post :create, plastic_collection_source: {address: @plastic_collection_source.address, contact_person: @plastic_collection_source.contact_person, eamil: @plastic_collection_source.eamil, name: @plastic_collection_source.name, phone_no_1: @plastic_collection_source.phone_no_1, phone_no_2: @plastic_collection_source.phone_no_2, website: @plastic_collection_source.website}
    end

    assert_redirected_to plastic_collection_source_path(assigns(:plastic_collection_source))
  end

  test "should show plastic_collection_source" do
    get :show, id: @plastic_collection_source
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plastic_collection_source
    assert_response :success
  end

  test "should update plastic_collection_source" do
    patch :update, id: @plastic_collection_source, plastic_collection_source: {address: @plastic_collection_source.address, contact_person: @plastic_collection_source.contact_person, eamil: @plastic_collection_source.eamil, name: @plastic_collection_source.name, phone_no_1: @plastic_collection_source.phone_no_1, phone_no_2: @plastic_collection_source.phone_no_2, website: @plastic_collection_source.website}
    assert_redirected_to plastic_collection_source_path(assigns(:plastic_collection_source))
  end

  test "should destroy plastic_collection_source" do
    assert_difference('PlasticCollectionSource.count', -1) do
      delete :destroy, id: @plastic_collection_source
    end

    assert_redirected_to plastic_collection_sources_path
  end
end
