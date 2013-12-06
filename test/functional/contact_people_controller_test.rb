require 'test_helper'

class ContactPeopleControllerTest < ActionController::TestCase
  setup do
    @contact_people = contact_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_people" do
    assert_difference('ContactPeople.count') do
      post :create, contact_people: @contact_people.attributes
    end

    assert_redirected_to contact_people_path(assigns(:contact_people))
  end

  test "should show contact_people" do
    get :show, id: @contact_people
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact_people
    assert_response :success
  end

  test "should update contact_people" do
    put :update, id: @contact_people, contact_people: @contact_people.attributes
    assert_redirected_to contact_people_path(assigns(:contact_people))
  end

  test "should destroy contact_people" do
    assert_difference('ContactPeople.count', -1) do
      delete :destroy, id: @contact_people
    end

    assert_redirected_to contact_people_path
  end
end
