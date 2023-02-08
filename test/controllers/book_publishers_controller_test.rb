require "test_helper"

class BookPublishersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_publisher = book_publishers(:one)
  end

  test "should get index" do
    get book_publishers_url
    assert_response :success
  end

  test "should get new" do
    get new_book_publisher_url
    assert_response :success
  end

  test "should create book_publisher" do
    assert_difference("BookPublisher.count") do
      post book_publishers_url, params: { book_publisher: { Publisher_id: @book_publisher.Publisher_id, book_title_id: @book_publisher.book_title_id, cover_pic: @book_publisher.cover_pic, date: @book_publisher.date } }
    end

    assert_redirected_to book_publisher_url(BookPublisher.last)
  end

  test "should show book_publisher" do
    get book_publisher_url(@book_publisher)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_publisher_url(@book_publisher)
    assert_response :success
  end

  test "should update book_publisher" do
    patch book_publisher_url(@book_publisher), params: { book_publisher: { Publisher_id: @book_publisher.Publisher_id, book_title_id: @book_publisher.book_title_id, cover_pic: @book_publisher.cover_pic, date: @book_publisher.date } }
    assert_redirected_to book_publisher_url(@book_publisher)
  end

  test "should destroy book_publisher" do
    assert_difference("BookPublisher.count", -1) do
      delete book_publisher_url(@book_publisher)
    end

    assert_redirected_to book_publishers_url
  end
end
