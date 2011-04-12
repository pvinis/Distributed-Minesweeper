class Tile
  attr_reader :state

  def initialize(bomb)
    @state = State::CLOSED
    @bomb = bomb
  end

  def is_bomb?
    @bomb
  end
end

class State
  CLOSED  = 1
  PRESSED = 2
  OPEN    = 3
end