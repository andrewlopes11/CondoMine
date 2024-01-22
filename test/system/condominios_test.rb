require "application_system_test_case"

class CondominiosTest < ApplicationSystemTestCase
  setup do
    @condominio = condominios(:one)
  end

  test "visiting the index" do
    visit condominios_url
    assert_selector "h1", text: "Condominios"
  end

  test "should create condominio" do
    visit condominios_url
    click_on "New condominio"

    fill_in "Cnpj", with: @condominio.cnpj
    fill_in "Nome", with: @condominio.nome
    click_on "Create Condominio"

    assert_text "Condominio was successfully created"
    click_on "Back"
  end

  test "should update Condominio" do
    visit condominio_url(@condominio)
    click_on "Edit this condominio", match: :first

    fill_in "Cnpj", with: @condominio.cnpj
    fill_in "Nome", with: @condominio.nome
    click_on "Update Condominio"

    assert_text "Condominio was successfully updated"
    click_on "Back"
  end

  test "should destroy Condominio" do
    visit condominio_url(@condominio)
    click_on "Destroy this condominio", match: :first

    assert_text "Condominio was successfully destroyed"
  end
end
