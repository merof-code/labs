require "test_helper"

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:one)
  end

  test "should get index" do
    get cards_url
    assert_response :success
  end

  test "should get new" do
    get new_card_url
    assert_response :success
  end

  test "should create card" do
    assert_difference("Card.count") do
      post cards_url, params: { card: { active: @card.active, end_date: @card.end_date, issue_date: @card.issue_date, issuer_id: @card.issuer_id, lost: @card.lost, photo: @card.photo, user_id: @card.user_id } }
    end

    assert_redirected_to card_url(Card.last)
  end

  test "should show card" do
    get card_url(@card)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_url(@card)
    assert_response :success
  end

  test "should update card" do
    patch card_url(@card), params: { card: { active: @card.active, end_date: @card.end_date, issue_date: @card.issue_date, issuer_id: @card.issuer_id, lost: @card.lost, photo: @card.photo, user_id: @card.user_id } }
    assert_redirected_to card_url(@card)
  end

  test "should destroy card" do
    assert_difference("Card.count", -1) do
      delete card_url(@card)
    end

    assert_redirected_to cards_url
  end
end
