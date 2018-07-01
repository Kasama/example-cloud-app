require 'test_helper'

class MedicamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medicamento = medicamentos(:one)
  end

  test "should get index" do
    get medicamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_medicamento_url
    assert_response :success
  end

  test "should create medicamento" do
    assert_difference('Medicamento.count') do
      post medicamentos_url, params: { medicamento: { CO_EAN: @medicamento.CO_EAN, CO_GGREM: @medicamento.CO_GGREM, NO_PRODUTO: @medicamento.NO_PRODUTO, NU_PF0_INTEIRO: @medicamento.NU_PF0_INTEIRO, NU_PF18_INTEIRO: @medicamento.NU_PF18_INTEIRO, NU_REGISTRO: @medicamento.NU_REGISTRO, ST_CAP: @medicamento.ST_CAP, ST_CONFAZ87: @medicamento.ST_CONFAZ87, ST_REST_HOSP: @medicamento.ST_REST_HOSP, TP_LCCT: @medicamento.TP_LCCT, TP_PRODUTO: @medicamento.TP_PRODUTO } }
    end

    assert_redirected_to medicamento_url(Medicamento.last)
  end

  test "should show medicamento" do
    get medicamento_url(@medicamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_medicamento_url(@medicamento)
    assert_response :success
  end

  test "should update medicamento" do
    patch medicamento_url(@medicamento), params: { medicamento: { CO_EAN: @medicamento.CO_EAN, CO_GGREM: @medicamento.CO_GGREM, NO_PRODUTO: @medicamento.NO_PRODUTO, NU_PF0_INTEIRO: @medicamento.NU_PF0_INTEIRO, NU_PF18_INTEIRO: @medicamento.NU_PF18_INTEIRO, NU_REGISTRO: @medicamento.NU_REGISTRO, ST_CAP: @medicamento.ST_CAP, ST_CONFAZ87: @medicamento.ST_CONFAZ87, ST_REST_HOSP: @medicamento.ST_REST_HOSP, TP_LCCT: @medicamento.TP_LCCT, TP_PRODUTO: @medicamento.TP_PRODUTO } }
    assert_redirected_to medicamento_url(@medicamento)
  end

  test "should destroy medicamento" do
    assert_difference('Medicamento.count', -1) do
      delete medicamento_url(@medicamento)
    end

    assert_redirected_to medicamentos_url
  end
end
