require 'test_helper'

class MenucategoriesControllerTest < ActionController::TestCase
  setup do
    @menucategory = menucategories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:menucategories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create menucategory" do
    assert_difference('Menucategory.count') do
      post :create, menucategory: { name: @menucategory.name }
    end

    assert_redirected_to menucategory_path(assigns(:menucategory))
  end

  test "should show menucategory" do
    get :show, id: @menucategory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @menucategory
    assert_response :success
  end

  test "should update menucategory" do
    patch :update, id: @menucategory, menucategory: { name: @menucategory.name }
    assert_redirected_to menucategory_path(assigns(:menucategory))
  end

  test "should destroy menucategory" do
    assert_difference('Menucategory.count', -1) do
      delete :destroy, id: @menucategory
    end

    assert_redirected_to menucategories_path
  end
end
