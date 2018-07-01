require "application_system_test_case"

class SubstanciasTest < ApplicationSystemTestCase
  setup do
    @substancia = substancias(:one)
  end

  test "visiting the index" do
    visit substancias_url
    assert_selector "h1", text: "Substancias"
  end

  test "creating a Substancia" do
    visit substancias_url
    click_on "New Substancia"

    fill_in "Ds Cas", with: @substancia.DS_CAS
    fill_in "Ds Substancia", with: @substancia.DS_SUBSTANCIA
    click_on "Create Substancia"

    assert_text "Substancia was successfully created"
    click_on "Back"
  end

  test "updating a Substancia" do
    visit substancias_url
    click_on "Edit", match: :first

    fill_in "Ds Cas", with: @substancia.DS_CAS
    fill_in "Ds Substancia", with: @substancia.DS_SUBSTANCIA
    click_on "Update Substancia"

    assert_text "Substancia was successfully updated"
    click_on "Back"
  end

  test "destroying a Substancia" do
    visit substancias_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Substancia was successfully destroyed"
  end
end
