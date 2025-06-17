require "test_helper"

class HealthCheckTest < ActionDispatch::IntegrationTest
  test "returns success on up path" do
    get rails_health_check_url
    assert_response :success
  end
end
