require "application_system_test_case"

class BookTitlesTest < ApplicationSystemTestCase
  setup do
    @book_title = book_titles(:one)
  end

  test "visiting the index" do
    visit book_titles_url
    assert_selector "h1", text: "Book titles"
  end

  test "should create book title" do
    visit book_titles_url
    click_on "New book title"

    fill_in "Author", with: @book_title.author_id
    fill_in "Name", with: @book_title.name
    fill_in "Published at", with: @book_title.published_at
    click_on "Create Book title"

    assert_text "Book title was successfully created"
    click_on "Back"
  end

  test "should update Book title" do
    visit book_title_url(@book_title)
    click_on "Edit this book title", match: :first

    fill_in "Author", with: @book_title.author_id
    fill_in "Name", with: @book_title.name
    fill_in "Published at", with: @book_title.published_at
    click_on "Update Book title"

    assert_text "Book title was successfully updated"
    click_on "Back"
  end

  test "should destroy Book title" do
    visit book_title_url(@book_title)
    click_on "Destroy this book title", match: :first

    assert_text "Book title was successfully destroyed"
  end
end
