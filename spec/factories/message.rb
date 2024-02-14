# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    association :user
    content { 'Hey! How you doing?' }
  end
end
