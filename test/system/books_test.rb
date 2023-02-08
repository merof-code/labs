require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Books"
  end

  test "should create book" do
    visit books_url
    click_on "New book"

    fill_in "Bookpublisher", with: @book.BookPublisher_id
    fill_in "Bought", with: @book.bought
    fill_in "Comments", with: @book.comments
    fill_in "Decommissioned", with: @book.decommissioned
    fill_in "Monetary value", with: @book.monetary_value
    click_on "Create Book"

    assert_text "Book was successfully created"
    click_on "Back"
  end

  test "should update Book" do
    visit book_url(@book)
    click_on "Edit this book", match: :first

    fill_in "Bookpublisher", with: @book.BookPublisher_id
    fill_in "Bought", with: @book.bought
    fill_in "Comments", with: @book.comments
    fill_in "Decommissioned", with: @book.decommissioned
    fill_in "Monetary value", with: @book.monetary_value
    click_on "Update Book"

    assert_text "Book was successfully updated"
    click_on "Back"
  end

  test "should destroy Book" do
    visit book_url(@book)
    click_on "Destroy this book", match: :first

    assert_text "Book was successfully destroyed"
  end
end
