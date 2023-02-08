require "test_helper"

class ExtensionReasonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @extension_reason = extension_reasons(:one)
  end

  test "should get index" do
    get extension_reasons_url
    assert_response :success
  end

  test "should get new" do
    get new_extension_reason_url
    assert_response :success
  end

  test "should create extension_reason" do
    assert_difference("ExtensionReason.count") do
      post extension_reasons_url, params: { extension_reason: { description: @extension_reason.description, end_date: @extension_reason.end_date, name: @extension_reason.name, start_date: @extension_reason.start_date } }
    end

    assert_redirected_to extension_reason_url(ExtensionReason.last)
  end

  test "should show extension_reason" do
    get extension_reason_url(@extension_reason)
    assert_response :success
  end

  test "should get edit" do
    get edit_extension_reason_url(@extension_reason)
    assert_response :success
  end

  test "should update extension_reason" do
    patch extension_reason_url(@extension_reason), params: { extension_reason: { description: @extension_reason.description, end_date: @extension_reason.end_date, name: @extension_reason.name, start_date: @extension_reason.start_date } }
    assert_redirected_to extension_reason_url(@extension_reason)
  end

  test "should destroy extension_reason" do
    assert_difference("ExtensionReason.count", -1) do
      delete extension_reason_url(@extension_reason)
    end

    assert_redirected_to extension_reasons_url
  end
end
