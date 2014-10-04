require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get comming" do
    get :comming
    assert_response :success
  end

end
