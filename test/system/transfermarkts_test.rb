require "application_system_test_case"

class TransfermarktsTest < ApplicationSystemTestCase
  setup do
    @transfermarkt = transfermarkts(:one)
  end

  test "visiting the index" do
    visit transfermarkts_url
    assert_selector "h1", text: "Transfermarkts"
  end

  test "should create transfermarkt" do
    visit transfermarkts_url
    click_on "New transfermarkt"

    fill_in "Crypto", with: @transfermarkt.crypto
    fill_in "Description", with: @transfermarkt.description
    fill_in "Timezone", with: @transfermarkt.timezone
    click_on "Create Transfermarkt"

    assert_text "Transfermarkt was successfully created"
    click_on "Back"
  end

  test "should update Transfermarkt" do
    visit transfermarkt_url(@transfermarkt)
    click_on "Edit this transfermarkt", match: :first

    fill_in "Crypto", with: @transfermarkt.crypto
    fill_in "Description", with: @transfermarkt.description
    fill_in "Timezone", with: @transfermarkt.timezone
    click_on "Update Transfermarkt"

    assert_text "Transfermarkt was successfully updated"
    click_on "Back"
  end

  test "should destroy Transfermarkt" do
    visit transfermarkt_url(@transfermarkt)
    click_on "Destroy this transfermarkt", match: :first

    assert_text "Transfermarkt was successfully destroyed"
  end
end
