require "application_system_test_case"

class FacultiesTest < ApplicationSystemTestCase
  setup do
    @faculty = faculties(:one)
  end

  test "visiting the index" do
    visit faculties_url
    assert_selector "h1", text: "Faculties"
  end

  test "should create facultie" do
    visit faculties_url
    click_on "New facultie"

    fill_in "Name", with: @faculty.name
    click_on "Create Facultie"

    assert_text "Facultie was successfully created"
    click_on "Back"
  end

  test "should update Facultie" do
    visit faculty_url(@faculty)
    click_on "Edit this facultie", match: :first

    fill_in "Name", with: @faculty.name
    click_on "Update Facultie"

    assert_text "Facultie was successfully updated"
    click_on "Back"
  end

  test "should destroy Facultie" do
    visit faculty_url(@faculty)
    click_on "Destroy this facultie", match: :first

    assert_text "Facultie was successfully destroyed"
  end
end
