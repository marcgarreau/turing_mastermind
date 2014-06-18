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

##################( Menu Assets )##################
  def print_intro
    border
    print "
            Welcome to Mastermind, Shitty.0!".red
    border_bottom
  end

  def border
    print "
=======================================================".blue
  end

  def border_bottom
    puts "
=======================================================".blue
  end

  def print_ready
    printf "\nAre you ready to play? (y)es, (n)o, or view (i)nstructions: "
  end

  def print_invalid_command
    puts "Invalid command. Are you ready? (type: y or n)"
  end

  def print_instructions
    puts "\nInstructions:\n
    On easy mode, guess a four letter combination of R, G, Y, and B.\n
    We'll give you feedback to help focus your next guess.\n
    You will lose the game if you don't guess the correct combination after 20 chances.\n
    Medium difficulty has 5 letters".blue
  end

  def print_outro
    puts "Bummer. See you next time."
  end

##################( Difficulty Validator )##################
  def validate_difficulty
    command = ""
    until command == ('e' || 'm' || 'h')
      difficulty_intro
      command = gets.chomp.downcase
      case command
      when 'e' then return "easy"
      when 'm' then return "medium"
      when 'h' then return "hard"
      else
        invalid_difficulty
      end
    end
  end

##################( Validator Assets )##################
  def difficulty_intro
    print "\nWhat difficulty would you like to play? (e)asy, (m)edium, or (h)ard? "
  end

  def invalid_difficulty
    puts "Invalid difficulty level. Please enter 'e' for easy, 'm' for medium, or 'h' for hard."
  end

end
