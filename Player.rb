class Player
  def initialize(name)
    self.name = name
    self.score = 0
  end

  def increase_score
    self.score += 1
  end

  def is_winner?
    self.score >= 3
  end

  attr_accessor :name
  attr_reader :score

  private

  attr_writer :score
end
