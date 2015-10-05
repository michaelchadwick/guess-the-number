#!/usr/bin/env ruby -w
# encoding: UTF-8

require_relative 'guess'

begin
  arg = ARGV[0].to_i

  top_num = arg > 0 ? arg : 100

  Guess.new(top_num).play
rescue => e
  puts "Error: #{e}"
end
