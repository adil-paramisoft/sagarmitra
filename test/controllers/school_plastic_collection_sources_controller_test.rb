require 'test_helper'

class SchoolPlasticCollectionSourcesControllerTest < ActionController::TestCase
  setup do
    @school_plastic_collection_source = school_plastic_collection_sources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:school_plastic_collection_sources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school_plastic_collection_source" do
    assert_difference('SchoolPlasticCollectionSource.count') do
      post :create, school_plastic_collection_source: {plastic_collection_source: @school_plastic_collection_source.plastic_collection_source, schoold_id: @school_plastic_collection_source.schoold_id}
    end

    assert_redirected_to school_plastic_collection_source_path(assigns(:school_plastic_collection_source))
  end

  test "should show school_plastic_collection_source" do
    get :show, id: @school_plastic_collection_source
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @school_plastic_collection_source
    assert_response :success
  end

  test "should update school_plastic_collection_source" do
    patch :update, id: @school_plastic_collection_source, school_plastic_collection_source: {plastic_collection_source: @school_plastic_collection_source.plastic_collection_source, schoold_id: @school_plastic_collection_source.schoold_id}
    assert_redirected_to school_plastic_collection_source_path(assigns(:school_plastic_collection_source))
  end

  test "should destroy school_plastic_collection_source" do
    assert_difference('SchoolPlasticCollectionSource.count', -1) do
      delete :destroy, id: @school_plastic_collection_source
    end

    assert_redirected_to school_plastic_collection_sources_path
  end
end
