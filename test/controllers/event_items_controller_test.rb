require 'test_helper'

class EventItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_item = event_items(:one)
  end

  test "should get index" do
    get event_items_url
    assert_response :success
  end

  test "should get new" do
    get new_event_item_url
    assert_response :success
  end

  test "should create event_item" do
    assert_difference('EventItem.count') do
      post event_items_url, params: { event_item: { event_id: @event_item.event_id, item_id: @event_item.item_id, status: @event_item.status, total: @event_item.total } }
    end

    assert_redirected_to event_item_url(EventItem.last)
  end

  test "should show event_item" do
    get event_item_url(@event_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_item_url(@event_item)
    assert_response :success
  end

  test "should update event_item" do
    patch event_item_url(@event_item), params: { event_item: { event_id: @event_item.event_id, item_id: @event_item.item_id, status: @event_item.status, total: @event_item.total } }
    assert_redirected_to event_item_url(@event_item)
  end

  test "should destroy event_item" do
    assert_difference('EventItem.count', -1) do
      delete event_item_url(@event_item)
    end

    assert_redirected_to event_items_url
  end
end
