require "application_system_test_case"

class MedicamentosTest < ApplicationSystemTestCase
  setup do
    @medicamento = medicamentos(:one)
  end

  test "visiting the index" do
    visit medicamentos_url
    assert_selector "h1", text: "Medicamentos"
  end

  test "creating a Medicamento" do
    visit medicamentos_url
    click_on "New Medicamento"

    fill_in "Co Ean", with: @medicamento.CO_EAN
    fill_in "Co Ggrem", with: @medicamento.CO_GGREM
    fill_in "No Produto", with: @medicamento.NO_PRODUTO
    fill_in "Nu Pf0 Inteiro", with: @medicamento.NU_PF0_INTEIRO
    fill_in "Nu Pf18 Inteiro", with: @medicamento.NU_PF18_INTEIRO
    fill_in "Nu Registro", with: @medicamento.NU_REGISTRO
    fill_in "St Cap", with: @medicamento.ST_CAP
    fill_in "St Confaz87", with: @medicamento.ST_CONFAZ87
    fill_in "St Rest Hosp", with: @medicamento.ST_REST_HOSP
    fill_in "Tp Lcct", with: @medicamento.TP_LCCT
    fill_in "Tp Produto", with: @medicamento.TP_PRODUTO
    click_on "Create Medicamento"

    assert_text "Medicamento was successfully created"
    click_on "Back"
  end

  test "updating a Medicamento" do
    visit medicamentos_url
    click_on "Edit", match: :first

    fill_in "Co Ean", with: @medicamento.CO_EAN
    fill_in "Co Ggrem", with: @medicamento.CO_GGREM
    fill_in "No Produto", with: @medicamento.NO_PRODUTO
    fill_in "Nu Pf0 Inteiro", with: @medicamento.NU_PF0_INTEIRO
    fill_in "Nu Pf18 Inteiro", with: @medicamento.NU_PF18_INTEIRO
    fill_in "Nu Registro", with: @medicamento.NU_REGISTRO
    fill_in "St Cap", with: @medicamento.ST_CAP
    fill_in "St Confaz87", with: @medicamento.ST_CONFAZ87
    fill_in "St Rest Hosp", with: @medicamento.ST_REST_HOSP
    fill_in "Tp Lcct", with: @medicamento.TP_LCCT
    fill_in "Tp Produto", with: @medicamento.TP_PRODUTO
    click_on "Update Medicamento"

    assert_text "Medicamento was successfully updated"
    click_on "Back"
  end

  test "destroying a Medicamento" do
    visit medicamentos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Medicamento was successfully destroyed"
  end
end
