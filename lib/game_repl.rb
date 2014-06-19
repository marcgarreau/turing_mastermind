require './lib/code_generator'
require './lib/code_matcher'
require './lib/guess_builder'
require './lib/game'
require './lib/code'
require 'pry'
require 'time_difference'

class GameREPL

##################( Main Menu )##################
  def start
    print_intro
    command = ""
    while command != 'q'
      print_ready
      command = gets.chomp.downcase
      case command
      when 'q' then print_outro
      when 'p' then Game.new.play
      when 'i' then print_instructions
      when 'why?' then print_sourpuss
      else
        print_invalid_command
      end
    end
  end

##################( Menu Assets )##################
  def print_intro
    border
    print_image
    puts "
           Welcome to Mastermind, Shitty.0!\n".red
    border_bottom
  end

  def print_image
    puts '
                         ____
                        /.../\
                       /.../##\
                      /.../####\
                     /.../######\
                    /.../###/\###\
                   /.../###/  \###\
                  /.../###/\   \###\
                 /.../###/  \   \###\
                /.../###/    \   \###\
               /.../###/      \   \###\
              /.../###/        \   \###\
             /.../###/          \   \###\
            /.../###/            \   \###\
           /.../###/______________\   \###\
          /........................\   \###\
         /..........................\   \###\
        -----------------------------    \###/
        \                                 \#/
         \_________________________________/
'
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
    printf "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit? "
  end

  def print_invalid_command
    puts "Invalid command. type 'p' to play, 'i' for instructions, or 'q' to quit.".red
  end

  def print_instructions
    puts "\nInstructions:\n
    On easy mode, guess a four letter combination of R, G, Y, and B.\n
    We'll give you feedback to help focus your next guess.\n
    You will lose the game if you don't guess the correct combination after 20 chances.\n
    Medium difficulty has 5 choices and 6 positions. Hard: 6 choices, 8 positions".blue
  end

  def print_sourpuss
    puts "Because games are fun. Don't be such a sourpuss.".red
  end

  def print_outro
    puts "Bummer. See you next time.".red
  end

##################( Difficulty Validator )##################
  def validate_difficulty
    loop do
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
    puts "Invalid difficulty level. Please enter 'e' for easy, 'm' for medium, or 'h' for hard.".red
  end

end
