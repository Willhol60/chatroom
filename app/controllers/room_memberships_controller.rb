# frozen_string_literal: true

class RoomMembershipsController < ApplicationController
  def create
    @room_membership = RoomMembership.new(room_membership_params)
    @room_membership.room_id = params[:room_id]
    if @room_membership.save
      redirect_to room_path(@room_membership.room_id)
    end
  end

  private

  def room_membership_params
    params.require(:room_membership).permit(:user_id)
  end
end
