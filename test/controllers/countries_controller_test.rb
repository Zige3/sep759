require "test_helper"

class CountriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get countries_index_url
    assert_response :success
  end

  test "should get details" do
    get countries_details_url
    assert_response :success
  end
end
