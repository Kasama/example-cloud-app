require 'test_helper'

class SecretariasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @secretaria = secretarias(:one)
  end

  test "should get index" do
    get secretarias_url
    assert_response :success
  end

  test "should get new" do
    get new_secretaria_url
    assert_response :success
  end

  test "should create secretaria" do
    assert_difference('Secretaria.count') do
      post secretarias_url, params: { secretaria: { ESTADO: @secretaria.ESTADO, MUNICIPIO: @secretaria.MUNICIPIO } }
    end

    assert_redirected_to secretaria_url(Secretaria.last)
  end

  test "should show secretaria" do
    get secretaria_url(@secretaria)
    assert_response :success
  end

  test "should get edit" do
    get edit_secretaria_url(@secretaria)
    assert_response :success
  end

  test "should update secretaria" do
    patch secretaria_url(@secretaria), params: { secretaria: { ESTADO: @secretaria.ESTADO, MUNICIPIO: @secretaria.MUNICIPIO } }
    assert_redirected_to secretaria_url(@secretaria)
  end

  test "should destroy secretaria" do
    assert_difference('Secretaria.count', -1) do
      delete secretaria_url(@secretaria)
    end

    assert_redirected_to secretarias_url
  end
end
