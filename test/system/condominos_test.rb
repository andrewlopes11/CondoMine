require "application_system_test_case"

class CondominosTest < ApplicationSystemTestCase
  setup do
    @condomino = condominos(:one)
  end

  test "visiting the index" do
    visit condominos_url
    assert_selector "h1", text: "Condominos"
  end

  test "should create condomino" do
    visit condominos_url
    click_on "New condomino"

    fill_in "Contato", with: @condomino.contato
    fill_in "Cpf", with: @condomino.cpf
    fill_in "Nome", with: @condomino.nome
    click_on "Create Condomino"

    assert_text "Condomino was successfully created"
    click_on "Back"
  end

  test "should update Condomino" do
    visit condomino_url(@condomino)
    click_on "Edit this condomino", match: :first

    fill_in "Contato", with: @condomino.contato
    fill_in "Cpf", with: @condomino.cpf
    fill_in "Nome", with: @condomino.nome
    click_on "Update Condomino"

    assert_text "Condomino was successfully updated"
    click_on "Back"
  end

  test "should destroy Condomino" do
    visit condomino_url(@condomino)
    click_on "Destroy this condomino", match: :first

    assert_text "Condomino was successfully destroyed"
  end
end
