require 'test_helper'

class MultiuploadsControllerTest < ActionController::TestCase
  setup do
    @multiupload = multiuploads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:multiuploads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create multiupload" do
    assert_difference('Multiupload.count') do
      post :create, multiupload: { name: @multiupload.name }
    end

    assert_redirected_to multiupload_path(assigns(:multiupload))
  end

  test "should show multiupload" do
    get :show, id: @multiupload
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @multiupload
    assert_response :success
  end

  test "should update multiupload" do
    patch :update, id: @multiupload, multiupload: { name: @multiupload.name }
    assert_redirected_to multiupload_path(assigns(:multiupload))
  end

  test "should destroy multiupload" do
    assert_difference('Multiupload.count', -1) do
      delete :destroy, id: @multiupload
    end

    assert_redirected_to multiuploads_path
  end
end
