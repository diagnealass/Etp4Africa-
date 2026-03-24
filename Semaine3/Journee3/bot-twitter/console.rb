require_relative './lib/twitter_service'
require 'dotenv'
require 'pry'
Dotenv.load

puts "Console interactive TwitterService"
puts "Tape : TwitterService.login_twitter"
puts "Ou : TwitterService.tweet('message')"

binding.pry