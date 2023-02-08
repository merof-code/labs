require "application_system_test_case"

class BookLinksTest < ApplicationSystemTestCase
  setup do
    @book_link = book_links(:one)
  end

  test "visiting the index" do
    visit book_links_url
    assert_selector "h1", text: "Book links"
  end

  test "should create book link" do
    visit book_links_url
    click_on "New book link"

    fill_in "Bookpublisher", with: @book_link.BookPublisher_id
    fill_in "Link", with: @book_link.link
    click_on "Create Book link"

    assert_text "Book link was successfully created"
    click_on "Back"
  end

  test "should update Book link" do
    visit book_link_url(@book_link)
    click_on "Edit this book link", match: :first

    fill_in "Bookpublisher", with: @book_link.BookPublisher_id
    fill_in "Link", with: @book_link.link
    click_on "Update Book link"

    assert_text "Book link was successfully updated"
    click_on "Back"
  end

  test "should destroy Book link" do
    visit book_link_url(@book_link)
    click_on "Destroy this book link", match: :first

    assert_text "Book link was successfully destroyed"
  end
end
