class Board
  attr_accessor :board

  @@winning_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize
    self.board = Array.new(9, nil)
  end

  def print_board
    print '---------------'
    puts ''
    board.each_with_index do |value, index|
      print "| #{value || ' '} |"
      next unless (index + 1) % 3 == 0

      puts ''
      print '---------------'
      puts ''
    end
  end

  def check_winner
    x = board.each_with_index.select { |value, _index| value == 'X' }.map { |_value, index| index }
    o = board.each_with_index.select { |value, _index| value == 'O' }.map { |_value, index| index }
    if is_winner?(x)
      'X'
    elsif is_winner?(o)
      'O'
    end
  end

  def reset_board
    self.board = Array.new(9, nil)
  end

  private

  def is_winner?(given_array)
    @@winning_combinations.each do |combination|
      matched = 0
      combination.each do |e|
        given_array.each do |ae|
          matched += 1 if ae == e
        end
        return true if matched >= 3
      end
    end
    false
  end
end
