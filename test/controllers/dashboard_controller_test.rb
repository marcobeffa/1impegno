require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get imprese" do
    get dashboard_imprese_url
    assert_response :success
  end

  test "should get progetti" do
    get dashboard_progetti_url
    assert_response :success
  end

  test "should get settimana" do
    get dashboard_settimana_url
    assert_response :success
  end

  test "should get obiettivo" do
    get dashboard_obiettivo_url
    assert_response :success
  end

  test "should get attivit" do
    get dashboard_attivit_url
    assert_response :success
  end

  test "should get processi" do
    get dashboard_processi_url
    assert_response :success
  end

  test "should get todo" do
    get dashboard_todo_url
    assert_response :success
  end
end
