require 'test_helper'

class SubstanciasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @substancia = substancias(:one)
  end

  test "should get index" do
    get substancias_url
    assert_response :success
  end

  test "should get new" do
    get new_substancia_url
    assert_response :success
  end

  test "should create substancia" do
    assert_difference('Substancia.count') do
      post substancias_url, params: { substancia: { DS_CAS: @substancia.DS_CAS, DS_SUBSTANCIA: @substancia.DS_SUBSTANCIA } }
    end

    assert_redirected_to substancia_url(Substancia.last)
  end

  test "should show substancia" do
    get substancia_url(@substancia)
    assert_response :success
  end

  test "should get edit" do
    get edit_substancia_url(@substancia)
    assert_response :success
  end

  test "should update substancia" do
    patch substancia_url(@substancia), params: { substancia: { DS_CAS: @substancia.DS_CAS, DS_SUBSTANCIA: @substancia.DS_SUBSTANCIA } }
    assert_redirected_to substancia_url(@substancia)
  end

  test "should destroy substancia" do
    assert_difference('Substancia.count', -1) do
      delete substancia_url(@substancia)
    end

    assert_redirected_to substancias_url
  end
end
