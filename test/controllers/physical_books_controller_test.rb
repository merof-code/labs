require "test_helper"

class PhysicalBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @physical_book = physical_books(:one)
  end

  test "should get index" do
    get physical_books_url
    assert_response :success
  end

  test "should get new" do
    get new_physical_book_url
    assert_response :success
  end

  test "should create physical_book" do
    assert_difference("PhysicalBook.count") do
      post physical_books_url, params: { physical_book: { book_id: @physical_book.book_id, bought: @physical_book.bought, comments: @physical_book.comments, decommissioned: @physical_book.decommissioned, monetary_value: @physical_book.monetary_value } }
    end

    assert_redirected_to physical_book_url(PhysicalBook.last)
  end

  test "should show physical_book" do
    get physical_book_url(@physical_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_physical_book_url(@physical_book)
    assert_response :success
  end

  test "should update physical_book" do
    patch physical_book_url(@physical_book), params: { physical_book: { book_id: @physical_book.book_id, bought: @physical_book.bought, comments: @physical_book.comments, decommissioned: @physical_book.decommissioned, monetary_value: @physical_book.monetary_value } }
    assert_redirected_to physical_book_url(@physical_book)
  end

  test "should destroy physical_book" do
    assert_difference("PhysicalBook.count", -1) do
      delete physical_book_url(@physical_book)
    end

    assert_redirected_to physical_books_url
  end
end
