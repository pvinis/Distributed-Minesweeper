require 'gosu'
require './Tile'

class MinesweeperWindow < Gosu::Window
  attr_reader :panel

  def initialize
    super 640, 480, false   ### false is for fullscreen
    self.caption = "Distributed Minesweeper"
    #panel
    @c = Tile.new(true)

  end

  def update
  end

  def draw
  end

end