require 'colorize'
require_relative 'messages'
require_relative 'mastermind'
# require 'pry'
# binding.pry
# input = ""
messages = Messages.new
mastermind = Mastermind.new(messages)
puts messages.welcome_message

signal = :continue

while signal == :continue
  print "> "
  input = gets.strip
  message, signal = mastermind.execute(input)
  puts message
end
puts messages.end_game
