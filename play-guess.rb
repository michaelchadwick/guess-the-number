#!/usr/bin/env ruby -w
# encoding: UTF-8

require_relative 'guess'

RANGE_BOTTOM_DEFAULT = 1
RANGE_TOP_DEFAULT = 100

begin
  # utilize player-specified values if valid
  arg1 = (ARGV[0].nil? || ARGV[0].to_i == 0) ? RANGE_BOTTOM_DEFAULT : ARGV[0].to_i
  arg2 = (ARGV[1].nil? || ARGV[1].to_i == 0) ? RANGE_TOP_DEFAULT : ARGV[1].to_i
  ARGV.clear
  new_game = Guess.new(arg1, arg2)
  new_game.play
rescue => e
  puts "Error: #{e}"
end
