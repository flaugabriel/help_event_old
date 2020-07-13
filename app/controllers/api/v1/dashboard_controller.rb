# frozen_string_literal: true
module Api
  module V1
    class DashboardController < BaseController
      before_action :authenticate_user!

      def index
        data_rray = []
        data = {}
        events_all = EventUser.where(user_id: current_user).all
        events_all.each do |events|
          data = {
            id: events.event.id,
            description: events.event.description,
            created_at: events.event.created_at,
            user: events.event.user.name,
            total: events.event.total,
            items: events.event.select_item_by_events(events.event.id).count
          }
        data_rray << data
        end
          render json: { event: data_rray }
      end
    end
  end
end
