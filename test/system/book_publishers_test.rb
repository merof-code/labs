require "application_system_test_case"

class BookPublishersTest < ApplicationSystemTestCase
  setup do
    @book_publisher = book_publishers(:one)
  end

  test "visiting the index" do
    visit book_publishers_url
    assert_selector "h1", text: "Book publishers"
  end

  test "should create book publisher" do
    visit book_publishers_url
    click_on "New book publisher"

    fill_in "Publisher", with: @book_publisher.Publisher_id
    fill_in "Book title", with: @book_publisher.book_title_id
    fill_in "Cover pic", with: @book_publisher.cover_pic
    fill_in "Date", with: @book_publisher.date
    click_on "Create Book publisher"

    assert_text "Book publisher was successfully created"
    click_on "Back"
  end

  test "should update Book publisher" do
    visit book_publisher_url(@book_publisher)
    click_on "Edit this book publisher", match: :first

    fill_in "Publisher", with: @book_publisher.Publisher_id
    fill_in "Book title", with: @book_publisher.book_title_id
    fill_in "Cover pic", with: @book_publisher.cover_pic
    fill_in "Date", with: @book_publisher.date
    click_on "Update Book publisher"

    assert_text "Book publisher was successfully updated"
    click_on "Back"
  end

  test "should destroy Book publisher" do
    visit book_publisher_url(@book_publisher)
    click_on "Destroy this book publisher", match: :first

    assert_text "Book publisher was successfully destroyed"
  end
end
