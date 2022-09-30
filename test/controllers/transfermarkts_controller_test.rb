require "test_helper"

class TransfermarktsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transfermarkt = transfermarkts(:one)
  end

  test "should get index" do
    get transfermarkts_url
    assert_response :success
  end

  test "should get new" do
    get new_transfermarkt_url
    assert_response :success
  end

  test "should create transfermarkt" do
    assert_difference("Transfermarkt.count") do
      post transfermarkts_url, params: { transfermarkt: { crypto: @transfermarkt.crypto, description: @transfermarkt.description, timezone: @transfermarkt.timezone } }
    end

    assert_redirected_to transfermarkt_url(Transfermarkt.last)
  end

  test "should show transfermarkt" do
    get transfermarkt_url(@transfermarkt)
    assert_response :success
  end

  test "should get edit" do
    get edit_transfermarkt_url(@transfermarkt)
    assert_response :success
  end

  test "should update transfermarkt" do
    patch transfermarkt_url(@transfermarkt), params: { transfermarkt: { crypto: @transfermarkt.crypto, description: @transfermarkt.description, timezone: @transfermarkt.timezone } }
    assert_redirected_to transfermarkt_url(@transfermarkt)
  end

  test "should destroy transfermarkt" do
    assert_difference("Transfermarkt.count", -1) do
      delete transfermarkt_url(@transfermarkt)
    end

    assert_redirected_to transfermarkts_url
  end
end
