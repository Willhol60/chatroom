# frozen_string_literal: true

desc 'Run the weekly stats email for all users'

task :send_weekly_stats_email do
  puts 'Running chat mailer for all users'
  User.find_each do |user|
    puts "Sending email for #{user.email}"
    ChatMailer.with(user: user).send_weekly_stats_email.deliver_now
  end
end
