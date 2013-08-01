require 'test_helper'

class CartoriosControllerTest < ActionController::TestCase
  setup do
    @cartorio = cartorios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cartorios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cartorio" do
    assert_difference('Cartorio.count') do
      post :create, cartorio: { atribuicao_id: @cartorio.atribuicao_id, bairro: @cartorio.bairro, celular: @cartorio.celular, cep: @cartorio.cep, cidade_id: @cartorio.cidade_id, codigo: @cartorio.codigo, comarca_id: @cartorio.comarca_id, email: @cartorio.email, historico: @cartorio.historico, nome: @cartorio.nome, rua: @cartorio.rua, telefone: @cartorio.telefone, tipoRegistro_id: @cartorio.tipoRegistro_id }
    end

    assert_redirected_to cartorio_path(assigns(:cartorio))
  end

  test "should show cartorio" do
    get :show, id: @cartorio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cartorio
    assert_response :success
  end

  test "should update cartorio" do
    patch :update, id: @cartorio, cartorio: { atribuicao_id: @cartorio.atribuicao_id, bairro: @cartorio.bairro, celular: @cartorio.celular, cep: @cartorio.cep, cidade_id: @cartorio.cidade_id, codigo: @cartorio.codigo, comarca_id: @cartorio.comarca_id, email: @cartorio.email, historico: @cartorio.historico, nome: @cartorio.nome, rua: @cartorio.rua, telefone: @cartorio.telefone, tipoRegistro_id: @cartorio.tipoRegistro_id }
    assert_redirected_to cartorio_path(assigns(:cartorio))
  end

  test "should destroy cartorio" do
    assert_difference('Cartorio.count', -1) do
      delete :destroy, id: @cartorio
    end

    assert_redirected_to cartorios_path
  end
end
