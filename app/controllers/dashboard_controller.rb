# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @events_all = EventUser.where(user_id: current_user.id)
  end
end
