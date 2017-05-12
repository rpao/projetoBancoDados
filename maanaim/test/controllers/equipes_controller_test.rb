require 'test_helper'

class EquipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipe = equipes(:one)
  end

  test "should get index" do
    get equipes_url
    assert_response :success
  end

  test "should get new" do
    get new_equipe_url
    assert_response :success
  end

  test "should create equipe" do
    assert_difference('Equipe.count') do
      post equipes_url, params: { equipe: { dtCadastro: @equipe.dtCadastro, nome: @equipe.nome, tipo: @equipe.tipo } }
    end

    assert_redirected_to equipe_url(Equipe.last)
  end

  test "should show equipe" do
    get equipe_url(@equipe)
    assert_response :success
  end

  test "should get edit" do
    get edit_equipe_url(@equipe)
    assert_response :success
  end

  test "should update equipe" do
    patch equipe_url(@equipe), params: { equipe: { dtCadastro: @equipe.dtCadastro, nome: @equipe.nome, tipo: @equipe.tipo } }
    assert_redirected_to equipe_url(@equipe)
  end

  test "should destroy equipe" do
    assert_difference('Equipe.count', -1) do
      delete equipe_url(@equipe)
    end

    assert_redirected_to equipes_url
  end
end
