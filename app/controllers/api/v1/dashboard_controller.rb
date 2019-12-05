# frozen_string_literal: true
module Api
  module V1
    class DashboardController < BaseController
      def index
        events_all = EventUser.where(user_id: current_user)
        render json: {events_all: events_all}
      end
    end
  end
end
