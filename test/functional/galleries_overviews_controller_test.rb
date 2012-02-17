require 'test_helper'

class GalleriesOverviewsControllerTest < ActionController::TestCase
  setup do
    @galleries_overview = galleries_overviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:galleries_overviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create galleries_overview" do
    assert_difference('GalleriesOverview.count') do
      post :create, galleries_overview: @galleries_overview.attributes
    end

    assert_redirected_to galleries_overview_path(assigns(:galleries_overview))
  end

  test "should show galleries_overview" do
    get :show, id: @galleries_overview
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @galleries_overview
    assert_response :success
  end

  test "should update galleries_overview" do
    put :update, id: @galleries_overview, galleries_overview: @galleries_overview.attributes
    assert_redirected_to galleries_overview_path(assigns(:galleries_overview))
  end

  test "should destroy galleries_overview" do
    assert_difference('GalleriesOverview.count', -1) do
      delete :destroy, id: @galleries_overview
    end

    assert_redirected_to galleries_overviews_path
  end
end
