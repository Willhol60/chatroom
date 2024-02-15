# frozen_string_literal: true

class ChatMailer < ApplicationMailer
  def send_weekly_stats_email
    @user = params[:user]
    @email_body = email_body

    mail(
      to: @user.email,
      subject: 'Weekly Usage Statistics',
      body: @email_body
    )
  end

  private

  attr_reader :user

  def email_body
    message = "#{total_messages} messages have been exchanged in the last week.\n"
    if @user.messages.any?
      message += "#{count_since_last(@user)} since your last message on #{date_of_last(@user).strftime('%e %b')}."
    end
    message
  end

  def total_messages
    Message.where('created_at > ?', Date.today - 7).count
  end

  def count_since_last
    Message.where('created_at > ?', date_of_last(@user)).count
  end

  def date_of_last
    @user.messages.last.created_at
  end
end
