#!/usr/bin/env ruby -w
# encoding: UTF-8

class Guess
  def initialize(top_num)
    @range_top = top_num
    @right_num = rand(0..@range_top)
    @guesses = 10
  end

  def play
    puts "Guess a number (in #{@guesses} guesses) from 1 to #{@range_top}: "
    guesses_left = @guesses

    while guesses_left > 0 do
      num = STDIN.gets.chomp.to_i
      guesses_left -= 1
      guess_text = guesses_left == 1 ? 'guess' : 'guesses'

      case
      when num > @right_num
        puts "Nope. Try a lower number (#{guesses_left} #{guess_text} left)."
      when num < @right_num
        puts "Nope. Try a higher number (#{guesses_left} #{guess_text} left)."
      when num == @right_num
        num_guesses = (@guesses-guesses_left)
        puts 'You win! :D'
        puts "You guessed the number '#{@right_num}' in #{num_guesses} guesses!"
        return
      end
    end

    puts 'You lose! :\'('
    puts "The correct number was #{@right_num}."
  end
end
