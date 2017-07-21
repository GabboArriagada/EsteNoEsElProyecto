require 'test_helper'

class DescargarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get descargar_index_url
    assert_response :success
  end

end
