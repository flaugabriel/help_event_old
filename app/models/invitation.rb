class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validate :verify_if_user_exist_invite, on: :create

  def viewed_invitation(id)
    Invitation.where(id: id).update(viewed: true)
  end

  def verify_if_user_exist_invite
    invitation = Invitation.where(user_id: user_id).present?
    return if invitation == false

    errors.add(:base, 'Já foi encaminhado um convite para esta pessoa!')
  end

  def afte_accept
    last_invitation = Invitation.last
    event = Event.find(last_invitation.event_id)
    EventUser.create(user_id: last_invitation.user_id,event_id: event.id)
    last_invitation.delete
  end
end
