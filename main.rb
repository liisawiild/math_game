# two player game
# math question: randomly picks two numbers between 1 - 20
# player has 3 lives, loses one if answers question wrong
# at the end of each turn it should populate the scores for both players
# game ends when one person loses all lives
# game should annouce who won and what their score was


# #EXAMPLE
# Player 1: What does 5 plus 3 equal?
# > 9
# Player 1: No!
# P1: 2/3 vs P2 3/3
# Player 2: What does 2 plus 6 equal?
# > 8
# Player 2 Yes, Correct!
# P1: 2/3 vs P2 3/3
# ----NEW TURN---
# ...some time later...
# Player 1 wins with a score of 1/3
# ----GAME OVER---
# Goodbye!



# Create a 2-Player math game where players take turns to answer simple math addition problems. 
# A new math question is generated for each turn by picking two numbers between 1 and 20. The player 
# whose turn it is is prompted the question and must answer correctly or lose a life.

# Ask - what has state and behaviour? = class
# complex - multiple steps = class
# functionality grouping = grouped in a class, most likely by the game class
# methods should have single responsibility


#Extract the nouns
# game - creates two players, holds the current player/turn, triggers a question, game over?, checks scores
# player - holds lives, name, score (lives/3), provides an answer
# question - rand(1..20) + rand(1..20), checks answer (right = next turn, wrong = -1 life from current player + next turn)

require './player.rb'
require './game.rb'
require './question.rb'


game = Game.new("Bob", "Frank")

while !game.game_over?
  question = Question.new(game.current_player)
  
  answer = gets.chomp.to_i
  if answer == question.correct_answer
    puts "Yes, correct!"
    game.display_score

  else
    puts "No!"
    game.current_player.lose_life
    game.display_score
  end
  
  game.new_turn
  puts "----- NEW TURN -----" unless game.game_over?
end

game.display_winner
