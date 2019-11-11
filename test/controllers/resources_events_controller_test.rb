require 'test_helper'

class ResourceEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resource_event = resource_events(:one)
  end

  test "should get index" do
    get resource_events_url
    assert_response :success
  end

  test "should get new" do
    get new_resource_event_url
    assert_response :success
  end

  test "should create resource_event" do
    assert_difference('ResourceEvent.count') do
      post resource_events_url, params: { resource_event: { event_id: @resource_event.event_id, resources_id: @resource_event.resources_id, status: @resource_event.status, total: @resource_event.total } }
    end

    assert_redirected_to resource_event_url(ResourceEvent.last)
  end

  test "should show resource_event" do
    get resource_event_url(@resource_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_resource_event_url(@resource_event)
    assert_response :success
  end

  test "should update resource_event" do
    patch resource_event_url(@resource_event), params: { resource_event: { event_id: @resource_event.event_id, resources_id: @resource_event.resources_id, status: @resource_event.status, total: @resource_event.total } }
    assert_redirected_to resource_event_url(@resource_event)
  end

  test "should destroy resource_event" do
    assert_difference('ResourceEvent.count', -1) do
      delete resource_event_url(@resource_event)
    end

    assert_redirected_to resource_events_url
  end
end
