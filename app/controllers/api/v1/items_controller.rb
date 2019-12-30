# frozen_string_literal: true

module Api
  module V1
    class ItemsController < BaseController
      include DeviseTokenAuth::Concerns::SetUserByToken

      before_action :authenticate_user!

      before_action :set_item, only: %i[show edit update destroy]

      # GET /items
      # GET /items.json
      def index
        items = Item.where(user_id: current_user.id)
        render json: { items: items }
      end

      # GET /items/1
      # GET /items/1.json
      def show
        permit_show
      end

      # GET /items/new
      def new
        @item = Item.new
      end

      # GET /items/1/edit
      def edit
        permit_show
      end

      # POST /items
      # POST /items.json
      def create
        @item = Item.new(user_id: current_user.id, description: params[:description], location: params[:location], value: params[:value])
        if @item.save
          flash[:success] = 'Item criado!'
          redirect_to items_path
        else
          flash[:error] = @item.errors.full_messagers.to_sentence
          redirect_to items_path
        end
      end

      # PATCH/PUT /items/1
      # PATCH/PUT /items/1.json
      def update
        if @item.update(item_params)
          flash[:success] = 'Item atualizado!'
          redirect_to items_path
        else
          flash[:error] = @item.errors.full_messagers.to_sentence
          redirect_to items_path
        end
      end

      # DELETE /items/1
      # DELETE /items/1.json
      def destroy
        @item.destroy
        respond_to do |format|
          format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      def permit_show
        return if Item.where(id: set_item.id, user_id: current_user).present?

        flash[:error] = 'Não altorizado!'
        redirect_to root_path
      end

      private

      def set_item
        @item = Item.find(params[:id])
      end

      def item_params
        params.require(:item).permit(:description, :value, :location, :user_id)
      end
    end
  end
end
