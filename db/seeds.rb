# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create users
user1 = User.create!(email: 'user1@example.com', password: 'password', encrypted_password: 'password')
user2 = User.create!(email: 'user2@example.com', password: 'password', encrypted_password: 'password')
user3 = User.create!(email: 'user3@example.com', password: 'password', encrypted_password: 'password')

# Sample messages
Message.create(user: user1, content: "Hey!", created_at: Time.now)
Message.create(user: user2, content: "Hi! How are you?", created_at: Time.now + 1.minute)
Message.create(user: user3, content: "All gravy, just building a chat app. How about you?", created_at: Time.now + 2.minutes)
Message.create(user: user1, content: "I'm alright, cooking up some dinner for my neighbour's uncle's fish.", created_at: Time.now + 3.minutes)
Message.create(user: user2, content: "Nice! What you making?", created_at: Time.now + 4.minutes)
Message.create(user: user3, content: "Yeah, I'm curious too.", created_at: Time.now + 5.minutes)
Message.create(user: user1, content: "Tuna rosti.", created_at: Time.now + 6.minutes)
Message.create(user: user2, content: "Delicious.", created_at: Time.now + 7.minutes)
Message.create(user: user3, content: "I want some.", created_at: Time.now + 8.minutes)
