require 'test_helper'

class PaginasControllerTest < ActionDispatch::IntegrationTest
  test "should get inicio" do
    get paginas_inicio_url
    assert_response :success
  end

  test "should get ajuda" do
    get paginas_ajuda_url
    assert_response :success
  end

end
