require 'test_helper'

class ResponsesControllerTest < ActionController::TestCase
  setup do
    @response = responses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:responses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create response" do
    assert_difference('Response.count') do
      post :create, response: { acted_upon_id: @response.acted_upon_id, acted_upon_type: @response.acted_upon_type, action: @response.action, action: @response.action, actor_id: @response.actor_id, controller: @response.controller, description: @response.description, status: @response.status, user_id: @response.user_id }
    end

    assert_redirected_to response_path(assigns(:response))
  end

  test "should show response" do
    get :show, id: @response
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @response
    assert_response :success
  end

  test "should update response" do
    patch :update, id: @response, response: { acted_upon_id: @response.acted_upon_id, acted_upon_type: @response.acted_upon_type, action: @response.action, action: @response.action, actor_id: @response.actor_id, controller: @response.controller, description: @response.description, status: @response.status, user_id: @response.user_id }
    assert_redirected_to response_path(assigns(:response))
  end

  test "should destroy response" do
    assert_difference('Response.count', -1) do
      delete :destroy, id: @response
    end

    assert_redirected_to responses_path
  end
end
