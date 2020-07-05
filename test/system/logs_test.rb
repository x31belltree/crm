require "application_system_test_case"

class LogsTest < ApplicationSystemTestCase
  setup do
    @log = logs(:one)
  end

  test "visiting the index" do
    visit logs_url
    assert_selector "h1", text: "Logs"
  end

  test "creating a Log" do
    visit logs_url
    click_on "New Log"

    fill_in "Comment", with: @log.comment
    fill_in "Matter", with: @log.matter_id
    fill_in "Next approach date", with: @log.next_approach_date
    fill_in "Status", with: @log.status
    click_on "Create Log"

    assert_text "Log was successfully created"
    click_on "Back"
  end

  test "updating a Log" do
    visit logs_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @log.comment
    fill_in "Matter", with: @log.matter_id
    fill_in "Next approach date", with: @log.next_approach_date
    fill_in "Status", with: @log.status
    click_on "Update Log"

    assert_text "Log was successfully updated"
    click_on "Back"
  end

  test "destroying a Log" do
    visit logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Log was successfully destroyed"
  end
end
