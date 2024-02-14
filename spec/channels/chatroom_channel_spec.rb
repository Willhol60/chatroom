# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChatroomChannel do
  it 'successfully subscribes' do
    subscribe
    expect(subscription).to be_confirmed
    expect(subscription).to have_stream_from('ChatroomChannel')
  end

  it 'successfully unsubscribes' do
    subscribe
    unsubscribe
    expect(subscription).to_not have_streams
  end
end
