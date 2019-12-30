# frozen_string_literal: true
module Api
  module V1
    class EventItemsController < BaseController
      skip_before_action :verify_authenticity_token
      include DeviseTokenAuth::Concerns::SetUserByToken

      before_action :authenticate_user!


      before_action :set_event_item, only: %i[show edit update destroy]

      # GET /event_items
      # GET /event_items.json
      def index
        @event_items = EventItem.all
      end

      # GET /event_items/1
      # GET /event_items/1.json
      def show
        @items = Item.where(user_id: current_user.id)
      end

      # GET /event_items/new
      def new
        @event_item = EventItem.new
      end

      # GET /event_items/1/edit
      def charge_status
        @event_item = EventItem.where(id: params[:id], item_id: params[:item_id]).take
        if @event_item.status
          if @event_item.update(status: false)
            flash[:success] = 'Item não comprado!'
            redirect_to event_path(@event_item.event.id)
          else
            flash[:error] = @event_item.errors.full_messages.to_sentence
            redirect_to event_path(@event_item.event.id)
          end
        else
          if @event_item.update(status: true)
            flash[:success] = 'Item comprado!'
            redirect_to event_path(@event_item.event.id)
          else
            flash[:error] = @event_item.errors.full_messages.to_sentence
            redirect_to event_path(@event_item.event.id)
          end
        end
      end

      # POST /event_items
      # POST /event_items.json
      def create
        @event_item = EventItem.new(event_item_params.merge(status: false))
        if @event_item.save
          EventItem.new.make_current_total(@event_item.event.id)
          flash[:success] = 'Item inserido!'
          redirect_to event_path(@event_item.event.id)
        else
          flash[:error] = @event_item.errors.full_messages.to_sentence
          redirect_to event_path(@event_item.event.id)
        end
      end

      # PATCH/PUT /event_items/1
      # PATCH/PUT /event_items/1.json
      def update
        respond_to do |format|
          if @event_item.update(event_item_params)
            format.html { redirect_to @event_item, notice: 'Event item was successfully updated.' }
            format.json { render :show, status: :ok, location: @event_item }
          else
            format.html { render :edit }
            format.json { render json: @event_item.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /event_items/1
      # DELETE /event_items/1.json
      def destroy
        EventItem.new.decrement_current_total(params[:id])
        @event_item.destroy
        flash[:success] = 'Item removido!'
        redirect_to event_path(@event_item.event.id)
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_event_item
        @event_item = EventItem.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def event_item_params
        params.require(:event_item).permit(:total, :status, :event_id, :item_id, :quantities)
      end
    end
  end
end
