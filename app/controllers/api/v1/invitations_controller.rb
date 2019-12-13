# frozen_string_literal: true

module Api
  module V1
    class InvitationsController < BaseController
      include DeviseTokenAuth::Concerns::SetUserByToken

      before_action :authenticate_user!

      before_action :set_invitation, only: %i[show edit update destroy]

      # GET /invitations
      # GET /invitations.json
      def index
        @invitations = Invitation.where(user_id: current_user.id)
        @events = Event.where(user_id: current_user.id)
        @users = User.all
        @invitation = Invitation.new
      end

      # GET /invitations/1
      # GET /invitations/1.json
      def accept
        invite = Invitation.find(params[:id])
        if invite.update(accept: true)
          flash[:success] = 'Convite aceito!'
          Invitation.new.afte_accept
          redirect_to invitations_path
        else
          flash[:error] = invite.errors.full_messages.to_sentence
          redirect_to invitations_path
        end
      end

      def show
        permit_show
        @invitation_envites_users = Invitation.new.select_users_by_events(params[:id])
        Invitation.new.viewed_invitation(params[:id])
      end

      # GET /invitations/new
      def new; end

      # GET /invitations/1/edit
      def edit; end

      # POST /invitations
      # POST /invitations.json
      def create
        @invitation = Invitation.new(invitation_params.merge(viewed: false))
        if @invitation.save
          flash[:success] = 'Convite enviado'
          redirect_to invitations_path
        else
          flash[:error] = @invitation.errors.full_messages.to_sentence
          redirect_to invitations_path
        end
      end

      # PATCH/PUT /invitations/1
      # PATCH/PUT /invitations/1.json
      def update
        respond_to do |format|
          if @invitation.update(invitation_params)
            format.html { redirect_to @invitation, notice: 'Invitation was successfully updated.' }
            format.json { render :show, status: :ok, location: @invitation }
          else
            format.html { render :edit }
            format.json { render json: @invitation.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /invitations/1
      # DELETE /invitations/1.json
      def destroy
        @invitation.destroy
        flash[:success] = 'Convite aceito!'
        redirect_to invitations_path
      end

      def permit_show
        return if Invitation.where(id: set_invitation.id, user_id: current_user)

        flash[:error] = 'Não altorizado!'
        redirect_to root_path
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_invitation
        @invitation = Invitation.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def invitation_params
        params.require(:invitation).permit(:user_id, :accept, :event_id)
      end
    end
  end
end
