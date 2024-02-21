# frozen_string_literal: true

class RoomsController < ApplicationController
  def index
    memberships = RoomMembership.where(user_id: current_user.id).select(:room_id)
    @rooms = accessible_rooms(memberships)
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @room_membership = RoomMembership.new
    room_memberships = RoomMembership.where(room_id: @room.id).select(:user_id)
    @users = User.where.not(id: room_memberships)
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      RoomMembership.create!(user_id: current_user.id, room_id: @room.id) if @room.private
      redirect_to room_path(@room)
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :private)
  end

  def accessible_rooms(memberships)
    Room.where(private: false).or(Room.where(id: memberships))
  end
end
