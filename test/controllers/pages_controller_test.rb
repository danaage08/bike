require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get delivery" do
    get pages_delivery_url
    assert_response :success
  end

  test "should get rules" do
    get pages_rules_url
    assert_response :success
  end

  test "should get contacts" do
    get pages_contacts_url
    assert_response :success
  end

  test "should get about" do
    get pages_about_url
    assert_response :success
  end
end
