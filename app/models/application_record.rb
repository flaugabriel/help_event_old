class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def select_users_by_events(event_id)
    EventUser.where(event_id: event_id)
  end
end
