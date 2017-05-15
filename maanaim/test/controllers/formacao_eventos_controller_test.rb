require 'test_helper'

class FormacaoEventosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @formacao_evento = formacao_eventos(:one)
  end

  test "should get index" do
    get formacao_eventos_url
    assert_response :success
  end

  test "should get new" do
    get new_formacao_evento_url
    assert_response :success
  end

  test "should create formacao_evento" do
    assert_difference('FormacaoEvento.count') do
      post formacao_eventos_url, params: { formacao_evento: { data: @formacao_evento.data, equipe_id: @formacao_evento.equipe_id, evento_id: @formacao_evento.evento_id, pessoa_id: @formacao_evento.pessoa_id } }
    end

    assert_redirected_to formacao_evento_url(FormacaoEvento.last)
  end

  test "should show formacao_evento" do
    get formacao_evento_url(@formacao_evento)
    assert_response :success
  end

  test "should get edit" do
    get edit_formacao_evento_url(@formacao_evento)
    assert_response :success
  end

  test "should update formacao_evento" do
    patch formacao_evento_url(@formacao_evento), params: { formacao_evento: { data: @formacao_evento.data, equipe_id: @formacao_evento.equipe_id, evento_id: @formacao_evento.evento_id, pessoa_id: @formacao_evento.pessoa_id } }
    assert_redirected_to formacao_evento_url(@formacao_evento)
  end

  test "should destroy formacao_evento" do
    assert_difference('FormacaoEvento.count', -1) do
      delete formacao_evento_url(@formacao_evento)
    end

    assert_redirected_to formacao_eventos_url
  end
end
