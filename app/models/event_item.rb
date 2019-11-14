class EventItem < ApplicationRecord
  belongs_to :event
  belongs_to :item
  validates_presence_of :quantities

  validate :presence_of_item

  def presence_of_item
    puts '=='
    puts item_id
    puts event_id
    item = EventItem.where(item_id: item_id, event_id: event_id).present?
    return if item

    errors.add(:item, ' jà incluido.')
  end

  def make_current_total(event_id)
    value_items = []
    event_item = EventItem.where(event_id: event_id)
    event_item.each do |event|
      value_items.push(event.item.value*event.quantities)
    end
    current_total_event = Event.find(event_id)
    current_total_event.update(total: value_items.sum)
  end

  def decrement_current_total(item_id)
    item_current_event = EventItem.find(item_id)
    puts "==="
    puts item_current_event.inspect
    event_current = Event.find(item_current_event.event_id)
    event_current.update(total: event_current.total - item_current_event.item.value)
  end
end
