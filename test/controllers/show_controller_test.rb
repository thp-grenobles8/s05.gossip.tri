require 'test_helper'

class ShowControllerTest < ActionDispatch::IntegrationTest
  test "should get gossips" do
    get show_gossips_url
    assert_response :success
  end

end
