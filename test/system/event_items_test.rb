require "application_system_test_case"

class EventItemsTest < ApplicationSystemTestCase
  setup do
    @event_item = event_items(:one)
  end

  test "visiting the index" do
    visit event_items_url
    assert_selector "h1", text: "Event Items"
  end

  test "creating a Event item" do
    visit event_items_url
    click_on "New Event Item"

    fill_in "Event", with: @event_item.event_id
    fill_in "Item", with: @event_item.item_id
    check "Status" if @event_item.status
    fill_in "Total", with: @event_item.total
    click_on "Create Event item"

    assert_text "Event item was successfully created"
    click_on "Back"
  end

  test "updating a Event item" do
    visit event_items_url
    click_on "Edit", match: :first

    fill_in "Event", with: @event_item.event_id
    fill_in "Item", with: @event_item.item_id
    check "Status" if @event_item.status
    fill_in "Total", with: @event_item.total
    click_on "Update Event item"

    assert_text "Event item was successfully updated"
    click_on "Back"
  end

  test "destroying a Event item" do
    visit event_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event item was successfully destroyed"
  end
end
