require "application_system_test_case"

class BorrowExtensionsTest < ApplicationSystemTestCase
  setup do
    @borrow_extension = borrow_extensions(:one)
  end

  test "visiting the index" do
    visit borrow_extensions_url
    assert_selector "h1", text: "Borrow extensions"
  end

  test "should create borrow extension" do
    visit borrow_extensions_url
    click_on "New borrow extension"

    fill_in "Borrow", with: @borrow_extension.Borrow_id
    fill_in "Extensionreason", with: @borrow_extension.ExtensionReason_id
    fill_in "Approver", with: @borrow_extension.approver_id
    fill_in "Cost", with: @borrow_extension.cost
    fill_in "Extended days", with: @borrow_extension.extended_days
    fill_in "New return date", with: @borrow_extension.new_return_date
    click_on "Create Borrow extension"

    assert_text "Borrow extension was successfully created"
    click_on "Back"
  end

  test "should update Borrow extension" do
    visit borrow_extension_url(@borrow_extension)
    click_on "Edit this borrow extension", match: :first

    fill_in "Borrow", with: @borrow_extension.Borrow_id
    fill_in "Extensionreason", with: @borrow_extension.ExtensionReason_id
    fill_in "Approver", with: @borrow_extension.approver_id
    fill_in "Cost", with: @borrow_extension.cost
    fill_in "Extended days", with: @borrow_extension.extended_days
    fill_in "New return date", with: @borrow_extension.new_return_date
    click_on "Update Borrow extension"

    assert_text "Borrow extension was successfully updated"
    click_on "Back"
  end

  test "should destroy Borrow extension" do
    visit borrow_extension_url(@borrow_extension)
    click_on "Destroy this borrow extension", match: :first

    assert_text "Borrow extension was successfully destroyed"
  end
end
