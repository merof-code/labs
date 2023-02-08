require "test_helper"

class BorrowExtensionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @borrow_extension = borrow_extensions(:one)
  end

  test "should get index" do
    get borrow_extensions_url
    assert_response :success
  end

  test "should get new" do
    get new_borrow_extension_url
    assert_response :success
  end

  test "should create borrow_extension" do
    assert_difference("BorrowExtension.count") do
      post borrow_extensions_url, params: { borrow_extension: { Borrow_id: @borrow_extension.Borrow_id, ExtensionReason_id: @borrow_extension.ExtensionReason_id, approver_id: @borrow_extension.approver_id, cost: @borrow_extension.cost, extended_days: @borrow_extension.extended_days, new_return_date: @borrow_extension.new_return_date } }
    end

    assert_redirected_to borrow_extension_url(BorrowExtension.last)
  end

  test "should show borrow_extension" do
    get borrow_extension_url(@borrow_extension)
    assert_response :success
  end

  test "should get edit" do
    get edit_borrow_extension_url(@borrow_extension)
    assert_response :success
  end

  test "should update borrow_extension" do
    patch borrow_extension_url(@borrow_extension), params: { borrow_extension: { Borrow_id: @borrow_extension.Borrow_id, ExtensionReason_id: @borrow_extension.ExtensionReason_id, approver_id: @borrow_extension.approver_id, cost: @borrow_extension.cost, extended_days: @borrow_extension.extended_days, new_return_date: @borrow_extension.new_return_date } }
    assert_redirected_to borrow_extension_url(@borrow_extension)
  end

  test "should destroy borrow_extension" do
    assert_difference("BorrowExtension.count", -1) do
      delete borrow_extension_url(@borrow_extension)
    end

    assert_redirected_to borrow_extensions_url
  end
end
