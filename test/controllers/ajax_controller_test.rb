require 'test_helper'

class AjaxControllerTest < ActionController::TestCase
  test "should get portfolio_detail" do
    get :portfolio_detail
    assert_response :success
  end

end
