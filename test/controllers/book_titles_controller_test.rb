require "test_helper"

class BookTitlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_title = book_titles(:one)
  end

  test "should get index" do
    get book_titles_url
    assert_response :success
  end

  test "should get new" do
    get new_book_title_url
    assert_response :success
  end

  test "should create book_title" do
    assert_difference("BookTitle.count") do
      post book_titles_url, params: { book_title: { author_id: @book_title.author_id, name: @book_title.name, published_at: @book_title.published_at } }
    end

    assert_redirected_to book_title_url(BookTitle.last)
  end

  test "should show book_title" do
    get book_title_url(@book_title)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_title_url(@book_title)
    assert_response :success
  end

  test "should update book_title" do
    patch book_title_url(@book_title), params: { book_title: { author_id: @book_title.author_id, name: @book_title.name, published_at: @book_title.published_at } }
    assert_redirected_to book_title_url(@book_title)
  end

  test "should destroy book_title" do
    assert_difference("BookTitle.count", -1) do
      delete book_title_url(@book_title)
    end

    assert_redirected_to book_titles_url
  end
end
