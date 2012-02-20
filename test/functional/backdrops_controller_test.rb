require 'test_helper'

class BackdropsControllerTest < ActionController::TestCase
  setup do
    @backdrop = backdrops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backdrops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backdrop" do
    assert_difference('Backdrop.count') do
      post :create, backdrop: @backdrop.attributes
    end

    assert_redirected_to backdrop_path(assigns(:backdrop))
  end

  test "should show backdrop" do
    get :show, id: @backdrop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backdrop
    assert_response :success
  end

  test "should update backdrop" do
    put :update, id: @backdrop, backdrop: @backdrop.attributes
    assert_redirected_to backdrop_path(assigns(:backdrop))
  end

  test "should destroy backdrop" do
    assert_difference('Backdrop.count', -1) do
      delete :destroy, id: @backdrop
    end

    assert_redirected_to backdrops_path
  end
end
