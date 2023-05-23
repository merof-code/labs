require "application_system_test_case"

class PhysicalBooksTest < ApplicationSystemTestCase
  setup do
    @physical_book = physical_books(:one)
  end

  test "visiting the index" do
    visit physical_books_url
    assert_selector "h1", text: "Physical books"
  end

  test "should create physical book" do
    visit physical_books_url
    click_on "New physical book"

    fill_in "Book", with: @physical_book.book_id
    fill_in "Bought", with: @physical_book.bought
    fill_in "Comments", with: @physical_book.comments
    fill_in "Decommissioned", with: @physical_book.decommissioned
    fill_in "Monetary value", with: @physical_book.monetary_value
    click_on "Create Physical book"

    assert_text "Physical book was successfully created"
    click_on "Back"
  end

  test "should update Physical book" do
    visit physical_book_url(@physical_book)
    click_on "Edit this physical book", match: :first

    fill_in "Book", with: @physical_book.book_id
    fill_in "Bought", with: @physical_book.bought
    fill_in "Comments", with: @physical_book.comments
    fill_in "Decommissioned", with: @physical_book.decommissioned
    fill_in "Monetary value", with: @physical_book.monetary_value
    click_on "Update Physical book"

    assert_text "Physical book was successfully updated"
    click_on "Back"
  end

  test "should destroy Physical book" do
    visit physical_book_url(@physical_book)
    click_on "Destroy this physical book", match: :first

    assert_text "Physical book was successfully destroyed"
  end
end
