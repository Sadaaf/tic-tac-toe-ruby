require_relative './Player'
require_relative './Board'

class Game
  def initialize(p1_name, p2_name)
    @player1 = Player.new(p1_name)
    @player2 = Player.new(p2_name)
    @board = Board.new
    @p1_turn = true
  end

  def start_game
    loop do
      puts "The players are #{@player1.name} with score #{@player1.score} and #{player2.name} with score #{@player2.score}"
      @board.print_board
      begin
        puts "#{@p1_turn ? @player1.name : @player2.name} Please enter your next move according to the square number 1-9"
        puts "Your symbol is #{@p1_turn ? 'X' : 'O'}"
        index = gets.chomp
        clear_terminal
        if index.to_i >= 1 && index.to_i <= 9 && @board.board[index.to_i - 1].nil?
          @board.board[index.to_i - 1] = @p1_turn ? 'X' : 'O'
          @p1_turn = !@p1_turn
        else
          puts 'invalid input'
        end
      rescue StandardError => e
        puts "Error occured #{e}"
      end
      if @board.check_winner == 'X'
        @player1.increase_score
        @board.reset_board
      elsif @board.check_winner == 'O'
        @player2.increase_score
        @board.reset_board
      elsif !@board.board.include?(nil)
        @board.reset_board
      end
      break if @player1.is_winner? || @player2.is_winner?
    end
    clear_terminal
    @board.print_board
    puts "Winner is #{player1.is_winner? ? @player1.name : player2.name}!!!!"
  end

  def clear_terminal
    system('clear') || system('cls')
  end

  private

  attr_accessor :player1, :player2
end

# Calling the game
puts 'Please enter player 1 name'
p1_name = gets.chomp
puts 'Please enter player 2 name'
p2_name = gets.chomp
game = Game.new(p1_name, p2_name)
game.clear_terminal
game.start_game
