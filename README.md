# Chatroom

This Web chat app is a prototype with just one chatroom. All users are subscribed to this chatroom and receive messages as they're sent by other users via websockets using ActionCable (requires Redis). A weekly email is sent to all users individually outlining their weekly message statistics.

* Ruby 3.0.0
* Rails 7.1.3
* Turbo



## Installation
    git clone git@github.com:willhol60/chatroom.git
    cd chatroom
    bundle
    rails db:setup
    redis-server (install first if required)
    rails s

Navigate to `http://localhost:3000/` and create an account as prompted.

The cron scheduling for the Weekly Stats Email can be adjusted in `config/schedule.rb`. Then run `whenever --update-crontab` in terminal.

## Tests
    rspec

## Future work/improvements
* Pagination/scrolling on chatroom
* Improved error handling
