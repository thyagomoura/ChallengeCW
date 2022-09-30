require "application_system_test_case"

class ManagersTest < ApplicationSystemTestCase
  setup do
    @manager = managers(:one)
  end

  test "visiting the index" do
    visit managers_url
    assert_selector "h1", text: "Managers"
  end

  test "should create manager" do
    visit managers_url
    click_on "New manager"

    fill_in "Email", with: @manager.email
    fill_in "Name", with: @manager.name
    fill_in "Nationality", with: @manager.nationality
    fill_in "Workteam", with: @manager.workteam
    click_on "Create Manager"

    assert_text "Manager was successfully created"
    click_on "Back"
  end

  test "should update Manager" do
    visit manager_url(@manager)
    click_on "Edit this manager", match: :first

    fill_in "Email", with: @manager.email
    fill_in "Name", with: @manager.name
    fill_in "Nationality", with: @manager.nationality
    fill_in "Workteam", with: @manager.workteam
    click_on "Update Manager"

    assert_text "Manager was successfully updated"
    click_on "Back"
  end

  test "should destroy Manager" do
    visit manager_url(@manager)
    click_on "Destroy this manager", match: :first

    assert_text "Manager was successfully destroyed"
  end
end
