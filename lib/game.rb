require_relative 'codebreaker'
require_relative '../modules/validation'

class Game
  include Validation
  def initialize
    p 'Hello, this is codebreaker game.'
    command = ''
    while command != 'exit'
      p 'Print one of next command'
      p 'start - start a game'
      p 'rules - show rules of game'
      p 'stats - show statistic of previous game'
      p 'exit - exit the game'
      command = gets.chomp
      case command
      when 'start'
        p 'Print your name'
        name = gets.chomp
        p 'Choose difficul of the game'
        p 'easy - 15 attempts and 2 hints'
        p 'medium - 10 attempts and 1 hint'
        p 'hell - 5 attempts and 1 hint'
        difficult = gets.chomp
        until validate_difficult(difficult)
          p 'Print difficult correctly'
          difficult = gets.chomp
        end
        game = Codebreaker.new(difficult)
        game.game
      when 'rules'
        p '----------'
        p 'The codebreaker gets some number of chances to break the code (depends on chosen difficulty). In each turn, the codebreaker makes a guess of 4 numbers. The codemaker then marks the guess with up to 4 signs - + or - or empty spaces.'
        p 'A + indicates an exact match: one of the numbers in the guess is the same as one of the numbers in the secret code and in the same position. For example:'
        p 'Secret number - 1234'
        p 'Input number - 6264'
        p 'Number of pluses - 2 (second and fourth position)'
        p 'A - indicates a number match: one of the numbers in the guess is the same as one of the numbers in the secret code but in a different position. For example:'
        p 'Secret number - 1234'
        p 'Input number - 6462'
        p 'Number of minuses - 2 (second and fourth position)'
        p 'An empty space indicates that there is not a current digit in a secret number.'
        p 'If codebreaker inputs the exact number as a secret number - codebreaker wins the game. If all attempts are spent - codebreaker loses.'
        p 'Codebreaker also has some number of hints(depends on chosen difficulty). If a user takes a hint - he receives back a separate digit of the secret code.'
        p '----------'
      when 'stats'
      when 'exit'
        p ''
      else
        p 'You have passed unexpected command. Please choose one from listed commands'
      end
    end
  end
end