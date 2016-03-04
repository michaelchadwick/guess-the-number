#!/usr/bin/env ruby -w
# encoding: UTF-8

# classic guess the number game, with optional user-supplied parameters
class Guess
  GUESSES_MAX = 10

  def initialize(range_first, range_second)
    if range_first <= range_second
      @rand_range = range_first..range_second
      @range_bottom = range_first
      @range_top = range_second
    else
      @rand_range = range_second..range_first
      @range_bottom = range_second
      @range_top = range_first
    end
  end

  def play
    @correct_number = rand(@rand_range)

    @guesses_remaining = GUESSES_MAX
    @guesses_count = 0
    player_success = false

    print_menu

    # keep taking guesses until GUESSES_MAX is reached
    while @guesses_count < GUESSES_MAX do
      print "(#{@guesses_remaining.to_s.rjust(2)} left): "

      num = gets.chomp

      unless num.empty?
        num = num.to_i

        case
        when num == @correct_number
          player_success = true
          break
        when num > @correct_number
          puts 'Nope. Try a LOWER number.' unless @guesses_count == GUESSES_MAX-1
        when num < @correct_number
          puts 'Nope. Try a HIGHER number.' unless @guesses_count == GUESSES_MAX-1
        end

        @guesses_count += 1
        @guesses_remaining -= 1
      end
    end

    if player_success
      player_win
    else
      player_lose
    end

    play_again?
  end

  private

  def player_win
    puts
    puts 'You WIN! :D'
    puts "You got the number '#{@correct_number}' in #{@guesses_count+1} guess(es)!"
  end

  def player_lose
    puts
    puts 'You LOSE! :\'('
    puts "The correct number was #{@correct_number}."
  end

  def play_again?
    puts
    print 'Again? (y/n) '
    STDIN.getc.chomp.downcase == 'y' ? self.play : exit(0)
  end

  def print_menu
    print_line
    puts '             // GUESS THE NUMBER \\\\'
    print_line
    puts "Guess a number (in #{GUESSES_MAX} guesses) from #{@range_bottom} to #{@range_top}"
    print_line
  end

  def print_line
    puts '------------------------------------------------'
  end
end
