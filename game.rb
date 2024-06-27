class Game 

  attr_accessor :player1, :player2, :current_player

  def initialize(name1, name2)
    @player1 = Player.new(name1)
    @player2 = Player.new(name2)
    @current_player = @player1
  end


  def new_turn
    @current_player = current_player == player1 ? player2 : player1
  end
  
  def game_over?
    player1.lives <= 0 || player2.lives <= 0
  end

  def display_score
    puts "#{player1.name}: #{player1.lives}/3 vs #{player2.name}: #{player2.lives}/3"
  end

  def display_winner
    if player1.lives > 0
      puts "#{player1.name} wins with a score of #{player1.lives}/3"
    else
      puts "#{player2.name} wins with a score of #{player2.lives}/3"
    end
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end


end