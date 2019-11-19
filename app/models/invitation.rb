class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def viewed_invitation(id)
    Invitation.where(id: id).update(viewed: true)
  end

  def select_users_by_events(event_id)
    EventUser.where(event_id: event_id)
  end

  def afte_accept
    last_invitation = Invitation.last
    event = Event.find(last_invitation.event_id)
    EventUser.create(user_id: last_invitation.user_id,event_id: event.id)
    last_invitation.delete
  end
end
