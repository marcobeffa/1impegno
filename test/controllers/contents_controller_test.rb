require "test_helper"

class ContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content = contents(:one)
  end

  test "should get index" do
    get contents_url
    assert_response :success
  end

  test "should get new" do
    get new_content_url
    assert_response :success
  end

  test "should create content" do
    assert_difference("Content.count") do
      post contents_url, params: { content: { body: @content.body, costo: @content.costo, descrizione: @content.descrizione, email: @content.email, img_url: @content.img_url, nome: @content.nome, ricavo: @content.ricavo, telefono: @content.telefono, tipo: @content.tipo } }
    end

    assert_redirected_to content_url(Content.last)
  end

  test "should show content" do
    get content_url(@content)
    assert_response :success
  end

  test "should get edit" do
    get edit_content_url(@content)
    assert_response :success
  end

  test "should update content" do
    patch content_url(@content), params: { content: { body: @content.body, costo: @content.costo, descrizione: @content.descrizione, email: @content.email, img_url: @content.img_url, nome: @content.nome, ricavo: @content.ricavo, telefono: @content.telefono, tipo: @content.tipo } }
    assert_redirected_to content_url(@content)
  end

  test "should destroy content" do
    assert_difference("Content.count", -1) do
      delete content_url(@content)
    end

    assert_redirected_to contents_url
  end
end
