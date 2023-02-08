require "application_system_test_case"

class BorrowsTest < ApplicationSystemTestCase
  setup do
    @borrow = borrows(:one)
  end

  test "visiting the index" do
    visit borrows_url
    assert_selector "h1", text: "Borrows"
  end

  test "should create borrow" do
    visit borrows_url
    click_on "New borrow"

    fill_in "Book", with: @borrow.Book_id
    fill_in "Approver", with: @borrow.approver_id
    fill_in "Borrow date", with: @borrow.borrow_date
    fill_in "Comments", with: @borrow.comments
    fill_in "Cost", with: @borrow.cost
    fill_in "Return date", with: @borrow.return_date
    fill_in "Return inspector", with: @borrow.return_inspector_id
    fill_in "Returned at", with: @borrow.returned_at
    fill_in "User", with: @borrow.user_id
    click_on "Create Borrow"

    assert_text "Borrow was successfully created"
    click_on "Back"
  end

  test "should update Borrow" do
    visit borrow_url(@borrow)
    click_on "Edit this borrow", match: :first

    fill_in "Book", with: @borrow.Book_id
    fill_in "Approver", with: @borrow.approver_id
    fill_in "Borrow date", with: @borrow.borrow_date
    fill_in "Comments", with: @borrow.comments
    fill_in "Cost", with: @borrow.cost
    fill_in "Return date", with: @borrow.return_date
    fill_in "Return inspector", with: @borrow.return_inspector_id
    fill_in "Returned at", with: @borrow.returned_at
    fill_in "User", with: @borrow.user_id
    click_on "Update Borrow"

    assert_text "Borrow was successfully updated"
    click_on "Back"
  end

  test "should destroy Borrow" do
    visit borrow_url(@borrow)
    click_on "Destroy this borrow", match: :first

    assert_text "Borrow was successfully destroyed"
  end
end
