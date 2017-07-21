require 'test_helper'

class ForoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get foro_index_url
    assert_response :success
  end

end
