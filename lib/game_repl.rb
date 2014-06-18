require './lib/code_generator'
require './lib/code_matcher'
require './lib/guess_builder'
require './lib/game'
require 'pry'
require 'time_difference'

class GameREPL

##################( Main Menu )##################
  def start
    print_intro
    command = ""
    while command != 'n'
      print_ready
      command = gets.chomp.downcase
      case command
      when 'n' then print_outro
      when 'y' then Game.new.play
      when 'i' then print_instructions
      else
        print_invalid_command
      end
    end
  end


  def validate_difficulty
    command = ""
    until command == ('e' || 'm' || 'h')
      puts "What difficulty would you like to play?"
      command = gets.chomp.downcase
      case command
      when 'e' then return "easy"
      when 'm' then return "medium"
      when 'h' then return "hard"
      else
        puts "Invalid difficulty level"
      end
    end
  end

##################( Menu Assets )##################
  def print_intro
    puts "
=======================================================
            Welcome to Mastermind, Shitty.0!
======================================================="
  end

  def print_ready
    printf "\nAre you ready to play? (y/n/i): "
  end

  def print_invalid_command
    puts "Invalid command. Are you ready? (type: y or n)"
  end

  def print_instructions
    puts "Instructions: Guess a four letter combination of R, G, Y, and B. We'll give you feedback to help focus your next guess."
  end

  def print_outro
    puts "Bummer. See you next time."
  end

end
