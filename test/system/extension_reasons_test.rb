require "application_system_test_case"

class ExtensionReasonsTest < ApplicationSystemTestCase
  setup do
    @extension_reason = extension_reasons(:one)
  end

  test "visiting the index" do
    visit extension_reasons_url
    assert_selector "h1", text: "Extension reasons"
  end

  test "should create extension reason" do
    visit extension_reasons_url
    click_on "New extension reason"

    fill_in "Description", with: @extension_reason.description
    fill_in "End date", with: @extension_reason.end_date
    fill_in "Name", with: @extension_reason.name
    fill_in "Start date", with: @extension_reason.start_date
    click_on "Create Extension reason"

    assert_text "Extension reason was successfully created"
    click_on "Back"
  end

  test "should update Extension reason" do
    visit extension_reason_url(@extension_reason)
    click_on "Edit this extension reason", match: :first

    fill_in "Description", with: @extension_reason.description
    fill_in "End date", with: @extension_reason.end_date
    fill_in "Name", with: @extension_reason.name
    fill_in "Start date", with: @extension_reason.start_date
    click_on "Update Extension reason"

    assert_text "Extension reason was successfully updated"
    click_on "Back"
  end

  test "should destroy Extension reason" do
    visit extension_reason_url(@extension_reason)
    click_on "Destroy this extension reason", match: :first

    assert_text "Extension reason was successfully destroyed"
  end
end
