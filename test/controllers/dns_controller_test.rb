require 'test_helper'

class DnsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dns_new_url
    assert_response :success
  end

end
