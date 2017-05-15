require 'test_helper'

class FazerPedidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fazer_pedido = fazer_pedidos(:one)
  end

  test "should get index" do
    get fazer_pedidos_url
    assert_response :success
  end

  test "should get new" do
    get new_fazer_pedido_url
    assert_response :success
  end

  test "should create fazer_pedido" do
    assert_difference('FazerPedido.count') do
      post fazer_pedidos_url, params: { fazer_pedido: { conta_id: @fazer_pedido.conta_id, evento_id: @fazer_pedido.evento_id, pedido_id: @fazer_pedido.pedido_id } }
    end

    assert_redirected_to fazer_pedido_url(FazerPedido.last)
  end

  test "should show fazer_pedido" do
    get fazer_pedido_url(@fazer_pedido)
    assert_response :success
  end

  test "should get edit" do
    get edit_fazer_pedido_url(@fazer_pedido)
    assert_response :success
  end

  test "should update fazer_pedido" do
    patch fazer_pedido_url(@fazer_pedido), params: { fazer_pedido: { conta_id: @fazer_pedido.conta_id, evento_id: @fazer_pedido.evento_id, pedido_id: @fazer_pedido.pedido_id } }
    assert_redirected_to fazer_pedido_url(@fazer_pedido)
  end

  test "should destroy fazer_pedido" do
    assert_difference('FazerPedido.count', -1) do
      delete fazer_pedido_url(@fazer_pedido)
    end

    assert_redirected_to fazer_pedidos_url
  end
end
