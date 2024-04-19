require "application_system_test_case"

class ResourcesTest < ApplicationSystemTestCase
  setup do
    @resource = resources(:one)
  end

  test "visiting the index" do
    visit resources_url
    assert_selector "h1", text: "Resources"
  end

  test "should create resource" do
    visit resources_url
    click_on "New resource"

    fill_in "Body", with: @resource.body
    fill_in "Costo", with: @resource.costo
    fill_in "Data", with: @resource.data
    fill_in "Descrizione", with: @resource.descrizione
    fill_in "Email", with: @resource.email
    fill_in "Energy", with: @resource.energy
    fill_in "Img url", with: @resource.img_url
    fill_in "Importanza", with: @resource.importanza
    fill_in "Nome", with: @resource.nome
    fill_in "Ricavo", with: @resource.ricavo
    fill_in "Telefono", with: @resource.telefono
    fill_in "Tipo", with: @resource.tipo
    fill_in "User", with: @resource.user_id
    fill_in "Visibility", with: @resource.visibility
    click_on "Create Resource"

    assert_text "Resource was successfully created"
    click_on "Back"
  end

  test "should update Resource" do
    visit resource_url(@resource)
    click_on "Edit this resource", match: :first

    fill_in "Body", with: @resource.body
    fill_in "Costo", with: @resource.costo
    fill_in "Data", with: @resource.data
    fill_in "Descrizione", with: @resource.descrizione
    fill_in "Email", with: @resource.email
    fill_in "Energy", with: @resource.energy
    fill_in "Img url", with: @resource.img_url
    fill_in "Importanza", with: @resource.importanza
    fill_in "Nome", with: @resource.nome
    fill_in "Ricavo", with: @resource.ricavo
    fill_in "Telefono", with: @resource.telefono
    fill_in "Tipo", with: @resource.tipo
    fill_in "User", with: @resource.user_id
    fill_in "Visibility", with: @resource.visibility
    click_on "Update Resource"

    assert_text "Resource was successfully updated"
    click_on "Back"
  end

  test "should destroy Resource" do
    visit resource_url(@resource)
    click_on "Destroy this resource", match: :first

    assert_text "Resource was successfully destroyed"
  end
end
