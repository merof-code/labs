require "application_system_test_case"

class CardsTest < ApplicationSystemTestCase
  setup do
    @card = cards(:one)
  end

  test "visiting the index" do
    visit cards_url
    assert_selector "h1", text: "Cards"
  end

  test "should create card" do
    visit cards_url
    click_on "New card"

    check "Active" if @card.active
    fill_in "End date", with: @card.end_date
    fill_in "Issue date", with: @card.issue_date
    fill_in "Issuer", with: @card.issuer_id
    fill_in "Lost", with: @card.lost
    fill_in "Photo", with: @card.photo
    fill_in "User", with: @card.user_id
    click_on "Create Card"

    assert_text "Card was successfully created"
    click_on "Back"
  end

  test "should update Card" do
    visit card_url(@card)
    click_on "Edit this card", match: :first

    check "Active" if @card.active
    fill_in "End date", with: @card.end_date
    fill_in "Issue date", with: @card.issue_date
    fill_in "Issuer", with: @card.issuer_id
    fill_in "Lost", with: @card.lost
    fill_in "Photo", with: @card.photo
    fill_in "User", with: @card.user_id
    click_on "Update Card"

    assert_text "Card was successfully updated"
    click_on "Back"
  end

  test "should destroy Card" do
    visit card_url(@card)
    click_on "Destroy this card", match: :first

    assert_text "Card was successfully destroyed"
  end
end
