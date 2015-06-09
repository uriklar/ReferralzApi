module Api
  module V1
    class InvitationsController < ApplicationController
      # POST /invitations
      # POST /invitations.json
      def create
        @invitation = Invitation.new(invitation_params)
        @invitation.sender_id = current_user.id

        if @invitation.save
          render json: @invitation, status: :created
        else
          render json: @invitation.errors, status: :unprocessable_entity
        end
      end

      private
        def invitation_params
          params.require(:invitation).permit(:recipient_phone)
        end
    end
  end
end

