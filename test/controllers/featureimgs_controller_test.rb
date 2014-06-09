require 'test_helper'

class FeatureimgsControllerTest < ActionController::TestCase
  setup do
    @featureimg = featureimgs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:featureimgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create featureimg" do
    assert_difference('Featureimg.count') do
      post :create, featureimg: { name: @featureimg.name }
    end

    assert_redirected_to featureimg_path(assigns(:featureimg))
  end

  test "should show featureimg" do
    get :show, id: @featureimg
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @featureimg
    assert_response :success
  end

  test "should update featureimg" do
    patch :update, id: @featureimg, featureimg: { name: @featureimg.name }
    assert_redirected_to featureimg_path(assigns(:featureimg))
  end

  test "should destroy featureimg" do
    assert_difference('Featureimg.count', -1) do
      delete :destroy, id: @featureimg
    end

    assert_redirected_to featureimgs_path
  end
end
