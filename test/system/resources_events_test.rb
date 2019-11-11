require "application_system_test_case"

class ResourceEventsTest < ApplicationSystemTestCase
  setup do
    @resource_event = resource_events(:one)
  end

  test "visiting the index" do
    visit resource_events_url
    assert_selector "h1", text: "Resources Events"
  end

  test "creating a Resources event" do
    visit resource_events_url
    click_on "New Resources Event"

    fill_in "Event", with: @resource_event.event_id
    fill_in "Resources", with: @resource_event.resources_id
    fill_in "Status", with: @resource_event.status
    fill_in "Total", with: @resource_event.total
    click_on "Create Resources event"

    assert_text "Resources event was successfully created"
    click_on "Back"
  end

  test "updating a Resources event" do
    visit resource_events_url
    click_on "Edit", match: :first

    fill_in "Event", with: @resource_event.event_id
    fill_in "Resources", with: @resource_event.resources_id
    fill_in "Status", with: @resource_event.status
    fill_in "Total", with: @resource_event.total
    click_on "Update Resources event"

    assert_text "Resources event was successfully updated"
    click_on "Back"
  end

  test "destroying a Resources event" do
    visit resource_events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Resources event was successfully destroyed"
  end
end
