require "test_helper"

class ManagersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manager = managers(:one)
  end

  test "should get index" do
    get managers_url
    assert_response :success
  end

  test "should get new" do
    get new_manager_url
    assert_response :success
  end

  test "should create manager" do
    assert_difference("Manager.count") do
      post managers_url, params: { manager: { email: @manager.email, name: @manager.name, nationality: @manager.nationality, workteam: @manager.workteam } }
    end

    assert_redirected_to manager_url(Manager.last)
  end

  test "should show manager" do
    get manager_url(@manager)
    assert_response :success
  end

  test "should get edit" do
    get edit_manager_url(@manager)
    assert_response :success
  end

  test "should update manager" do
    patch manager_url(@manager), params: { manager: { email: @manager.email, name: @manager.name, nationality: @manager.nationality, workteam: @manager.workteam } }
    assert_redirected_to manager_url(@manager)
  end

  test "should destroy manager" do
    assert_difference("Manager.count", -1) do
      delete manager_url(@manager)
    end

    assert_redirected_to managers_url
  end
end
