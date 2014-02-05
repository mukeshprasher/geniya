require 'test_helper'

class UpdatesControllerTest < ActionController::TestCase
  setup do
    @update = updates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:updates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create update" do
    assert_difference('Update.count') do
      post :create, update: { privacy: @update.privacy, receiver_user_id: @update.receiver_user_id, sender_user_id: @update.sender_user_id, text: @update.text }
    end

    assert_redirected_to update_path(assigns(:update))
  end

  test "should show update" do
    get :show, id: @update
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @update
    assert_response :success
  end

  test "should update update" do
    patch :update, id: @update, update: { privacy: @update.privacy, receiver_user_id: @update.receiver_user_id, sender_user_id: @update.sender_user_id, text: @update.text }
    assert_redirected_to update_path(assigns(:update))
  end

  test "should destroy update" do
    assert_difference('Update.count', -1) do
      delete :destroy, id: @update
    end

    assert_redirected_to updates_path
  end
end
