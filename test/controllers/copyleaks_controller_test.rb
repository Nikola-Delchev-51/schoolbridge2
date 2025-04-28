require "test_helper"

class CopyleaksControllerTest < ActionDispatch::IntegrationTest
  test "should get webhook" do
    get copyleaks_webhook_url
    assert_response :success
  end
end
