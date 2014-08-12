require 'test_helper'

class FeedbackRepliesControllerTest < ActionController::TestCase
  setup do
    @feedback_reply = feedback_replies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feedback_replies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feedback_reply" do
    assert_difference('FeedbackReply.count') do
      post :create, feedback_reply: { message: @feedback_reply.message, parent_id: @feedback_reply.parent_id, user_id: @feedback_reply.user_id }
    end

    assert_redirected_to feedback_reply_path(assigns(:feedback_reply))
  end

  test "should show feedback_reply" do
    get :show, id: @feedback_reply
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feedback_reply
    assert_response :success
  end

  test "should update feedback_reply" do
    patch :update, id: @feedback_reply, feedback_reply: { message: @feedback_reply.message, parent_id: @feedback_reply.parent_id, user_id: @feedback_reply.user_id }
    assert_redirected_to feedback_reply_path(assigns(:feedback_reply))
  end

  test "should destroy feedback_reply" do
    assert_difference('FeedbackReply.count', -1) do
      delete :destroy, id: @feedback_reply
    end

    assert_redirected_to feedback_replies_path
  end
end
