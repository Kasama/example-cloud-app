require 'test_helper'

class FarmaceuticosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @farmaceutico = farmaceuticos(:one)
  end

  test "should get index" do
    get farmaceuticos_url
    assert_response :success
  end

  test "should get new" do
    get new_farmaceutico_url
    assert_response :success
  end

  test "should create farmaceutico" do
    assert_difference('Farmaceutico.count') do
      post farmaceuticos_url, params: { farmaceutico: { CPF: @farmaceutico.CPF, ENDERECO: @farmaceutico.ENDERECO, NOME: @farmaceutico.NOME } }
    end

    assert_redirected_to farmaceutico_url(Farmaceutico.last)
  end

  test "should show farmaceutico" do
    get farmaceutico_url(@farmaceutico)
    assert_response :success
  end

  test "should get edit" do
    get edit_farmaceutico_url(@farmaceutico)
    assert_response :success
  end

  test "should update farmaceutico" do
    patch farmaceutico_url(@farmaceutico), params: { farmaceutico: { CPF: @farmaceutico.CPF, ENDERECO: @farmaceutico.ENDERECO, NOME: @farmaceutico.NOME } }
    assert_redirected_to farmaceutico_url(@farmaceutico)
  end

  test "should destroy farmaceutico" do
    assert_difference('Farmaceutico.count', -1) do
      delete farmaceutico_url(@farmaceutico)
    end

    assert_redirected_to farmaceuticos_url
  end
end
