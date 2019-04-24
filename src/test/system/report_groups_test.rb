require "application_system_test_case"

class ReportGroupsTest < ApplicationSystemTestCase
  setup do
    @report_group = report_groups(:one)
  end

  test "visiting the index" do
    visit report_groups_url
    assert_selector "h1", text: "Report Groups"
  end

  test "creating a Report group" do
    visit report_groups_url
    click_on "New Report Group"

    fill_in "Name", with: @report_group.name
    click_on "Create Report group"

    assert_text "Report group was successfully created"
    click_on "Back"
  end

  test "updating a Report group" do
    visit report_groups_url
    click_on "Edit", match: :first

    fill_in "Name", with: @report_group.name
    click_on "Update Report group"

    assert_text "Report group was successfully updated"
    click_on "Back"
  end

  test "destroying a Report group" do
    visit report_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Report group was successfully destroyed"
  end
end
