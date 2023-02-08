require "test_helper"

class BookLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_link = book_links(:one)
  end

  test "should get index" do
    get book_links_url
    assert_response :success
  end

  test "should get new" do
    get new_book_link_url
    assert_response :success
  end

  test "should create book_link" do
    assert_difference("BookLink.count") do
      post book_links_url, params: { book_link: { BookPublisher_id: @book_link.BookPublisher_id, link: @book_link.link } }
    end

    assert_redirected_to book_link_url(BookLink.last)
  end

  test "should show book_link" do
    get book_link_url(@book_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_link_url(@book_link)
    assert_response :success
  end

  test "should update book_link" do
    patch book_link_url(@book_link), params: { book_link: { BookPublisher_id: @book_link.BookPublisher_id, link: @book_link.link } }
    assert_redirected_to book_link_url(@book_link)
  end

  test "should destroy book_link" do
    assert_difference("BookLink.count", -1) do
      delete book_link_url(@book_link)
    end

    assert_redirected_to book_links_url
  end
end
