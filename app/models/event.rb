class Event < ApplicationRecord
  belongs_to :user


  def select_item_by_events(event_id)
    EventItem.where(event_id: event_id)
  end

  def total_event(id)
    item_ids =  EventItem.where(event_id: id).select(:item_id)
    items = Item.where(id: item_ids).select(:value, :quantities)
    total = items.sum(:value) * items.sum(:quantities)
  end

  def delete_event(id)
    event_user = EventUser.where(event_id: id)
    event_user.delete_all
  end

  def event_create
    t = Event.last
    user_events = EventUser.where(event_id: t.id)
    if user_events.present?
      return true
    else
      EventUser.create(event_id: t.id,user_id: t.user_id)
    end
  end
end
