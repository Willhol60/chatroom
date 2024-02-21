# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    association :user
    association :room
    content { 'Hey! How you doing?' }
  end
end
