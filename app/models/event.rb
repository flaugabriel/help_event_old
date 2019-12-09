class Event < ApplicationRecord
  belongs_to :user

  validates_presence_of :data_event
  validates_presence_of :description

  validate :verifi_name, on: :create

  def verifi_name
    namepresent = User.find(user_id)
    return if namepresent.name.present?

    errors.add(:base, ' Voçê precisa inserir um apelido antes.')
  end

  def get_item_not_inclued(event_id,current_user)
    item_array = []
    event_items = Event.new.select_item_by_events(event_id)
    event_items.each do |item|
      item_array << item.item_id
    end
    Item.where(user_id: current_user).where.not(id: item_array)
  end

  def select_item_by_events(event_id)
    EventItem.where(event_id: event_id)
  end

  def delete_event(id)
    event_item = EventItem.where(event_id: id)
    event_item.delete_all
    event_user = EventUser.where(event_id: id)
    event_user.delete_all
  end

  def event_create
    t = Event.last
    user_events = EventUser.where(event_id: t.id)
    if user_events.present?
      return true
    else
      EventUser.create(event_id: t.id, user_id: t.user_id)
    end
  end
end
