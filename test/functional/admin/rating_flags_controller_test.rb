require 'test_helper'

class Admin::RatingFlagsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
