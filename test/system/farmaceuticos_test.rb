require "application_system_test_case"

class FarmaceuticosTest < ApplicationSystemTestCase
  setup do
    @farmaceutico = farmaceuticos(:one)
  end

  test "visiting the index" do
    visit farmaceuticos_url
    assert_selector "h1", text: "Farmaceuticos"
  end

  test "creating a Farmaceutico" do
    visit farmaceuticos_url
    click_on "New Farmaceutico"

    fill_in "Cpf", with: @farmaceutico.CPF
    fill_in "Endereco", with: @farmaceutico.ENDERECO
    fill_in "Nome", with: @farmaceutico.NOME
    click_on "Create Farmaceutico"

    assert_text "Farmaceutico was successfully created"
    click_on "Back"
  end

  test "updating a Farmaceutico" do
    visit farmaceuticos_url
    click_on "Edit", match: :first

    fill_in "Cpf", with: @farmaceutico.CPF
    fill_in "Endereco", with: @farmaceutico.ENDERECO
    fill_in "Nome", with: @farmaceutico.NOME
    click_on "Update Farmaceutico"

    assert_text "Farmaceutico was successfully updated"
    click_on "Back"
  end

  test "destroying a Farmaceutico" do
    visit farmaceuticos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Farmaceutico was successfully destroyed"
  end
end
