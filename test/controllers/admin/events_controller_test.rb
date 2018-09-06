require 'test_helper'

class Admin::EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = admin_events(:one)
  end

  test "should get index" do
    get admin_events_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_event_url
    assert_response :success
  end

  test "should create admin_event" do
    assert_difference('Admin::Event.count') do
      post admin_events_url, params: {event: {description: @event.description, drive_link: @event.drive_link, enddate: @event.enddate, startdate: @event.startdate, state: @event.state, title: @event.title } }
    end

    assert_redirected_to admin_event_url(Admin::Event.last)
  end

  test "should show admin_event" do
    get admin_event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_event_url(@event)
    assert_response :success
  end

  test "should update admin_event" do
    patch admin_event_url(@event), params: {event: {description: @event.description, drive_link: @event.drive_link, enddate: @event.enddate, startdate: @event.startdate, state: @event.state, title: @event.title } }
    assert_redirected_to admin_event_url(@event)
  end

  test "should destroy admin_event" do
    assert_difference('Admin::Event.count', -1) do
      delete admin_event_url(@event)
    end

    assert_redirected_to admin_events_url
  end
end
