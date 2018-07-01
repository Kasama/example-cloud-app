require "application_system_test_case"

class SecretariasTest < ApplicationSystemTestCase
  setup do
    @secretaria = secretarias(:one)
  end

  test "visiting the index" do
    visit secretarias_url
    assert_selector "h1", text: "Secretarias"
  end

  test "creating a Secretaria" do
    visit secretarias_url
    click_on "New Secretaria"

    fill_in "Estado", with: @secretaria.ESTADO
    fill_in "Municipio", with: @secretaria.MUNICIPIO
    click_on "Create Secretaria"

    assert_text "Secretaria was successfully created"
    click_on "Back"
  end

  test "updating a Secretaria" do
    visit secretarias_url
    click_on "Edit", match: :first

    fill_in "Estado", with: @secretaria.ESTADO
    fill_in "Municipio", with: @secretaria.MUNICIPIO
    click_on "Update Secretaria"

    assert_text "Secretaria was successfully updated"
    click_on "Back"
  end

  test "destroying a Secretaria" do
    visit secretarias_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Secretaria was successfully destroyed"
  end
end
