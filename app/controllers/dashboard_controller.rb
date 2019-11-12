class DashboardController < ApplicationController
  def index
    @events_all = EventUser.where(user_id: current_user.id)
  end
end
