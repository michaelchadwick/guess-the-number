#!/usr/bin/env ruby -w
# encoding: UTF-8

class Guess
  def initialize
    @right_num = rand(100)+1
    @guesses = 10
  end
  
  def play
    puts "Guess a number (in #{@guesses} guesses) from 1 to 100: "
    guesses_left = @guesses
    while guesses_left > 0 do
      num = gets
      num = num.to_i
      case
      when num > @right_num
        puts "Nope. Try a lower number."
      when num < @right_num
        puts "Nope. Try a higher number."
      when num == @right_num
        num_guesses = (@guesses-guesses_left)+1
        puts "That's it! :D"
        puts "You guessed the number '#{@right_num}' in #{num_guesses} guesses!"
        return
      end
      guesses_left -= 1
    end
    puts "You lose :("
    puts "The correct number was #{@right_num}."
  end
end