require 'test_helper'

class ContControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get cont_contact_url
    assert_response :success
  end

end
