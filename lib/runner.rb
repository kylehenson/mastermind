require 'colorize'
require 'pry'
require 'pry-byebug'

require_relative 'message'
require_relative 'mastermind'
require_relative 'checker'

mastermind = Mastermind.new
puts Message.welcome

signal = :continue

while signal == :continue
  print "> "
  input = gets.strip
  message, signal = mastermind.execute(input)
  puts message
end
