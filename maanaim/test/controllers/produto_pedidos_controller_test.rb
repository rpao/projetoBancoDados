require 'test_helper'

class ProdutoPedidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @produto_pedido = produto_pedidos(:one)
  end

  test "should get index" do
    get produto_pedidos_url
    assert_response :success
  end

  test "should get new" do
    get new_produto_pedido_url
    assert_response :success
  end

  test "should create produto_pedido" do
    assert_difference('ProdutoPedido.count') do
      post produto_pedidos_url, params: { produto_pedido: { pedido_id: @produto_pedido.pedido_id, produto_id: @produto_pedido.produto_id } }
    end

    assert_redirected_to produto_pedido_url(ProdutoPedido.last)
  end

  test "should show produto_pedido" do
    get produto_pedido_url(@produto_pedido)
    assert_response :success
  end

  test "should get edit" do
    get edit_produto_pedido_url(@produto_pedido)
    assert_response :success
  end

  test "should update produto_pedido" do
    patch produto_pedido_url(@produto_pedido), params: { produto_pedido: { pedido_id: @produto_pedido.pedido_id, produto_id: @produto_pedido.produto_id } }
    assert_redirected_to produto_pedido_url(@produto_pedido)
  end

  test "should destroy produto_pedido" do
    assert_difference('ProdutoPedido.count', -1) do
      delete produto_pedido_url(@produto_pedido)
    end

    assert_redirected_to produto_pedidos_url
  end
end
