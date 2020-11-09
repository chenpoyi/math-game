require './player'

class Game 
  def initialize
    @total_questions = 0
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @current_player = @player1
    puts @player1
    main_loop
  end

  def main_loop 
    while @player1.lives > 0 && @player2.lives > 0
      puts "----- NEW TURN -----"
      ask_question(@current_player)
      if @current_player == @player1
        @current_player = @player2
      else 
        @current_player = @player1
      end
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"

    end

    puts "#{@current_player.name} wins with a score of #{@current_player.lives}/3"
    puts "--- GAME OVER ---"
    puts "Good bye!"
  end

  def ask_question (player)
    solution = generate_question(player)
    player_answer = gets.chomp.to_i
    
    if solution == player_answer
      puts "YES! You are correct."
    else
      puts "Seriously? No!"
      player.decrement
    end
  end

  def generate_question(player)
    num_1 = random_number
    num_2 = random_number
    
    puts "#{player.name}: What does #{num_1} plus #{num_2} equal?"

    num_1 + num_2
  end

  


  def random_number
    rand(1..10)
  end

end