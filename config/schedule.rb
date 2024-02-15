# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

set :output, { error: 'log/cron_error_log.log', standard: 'log/cron_log.log' }
set :environment, 'development'

every 1.week do
    rake "send_weekly_stats_email"    
end

