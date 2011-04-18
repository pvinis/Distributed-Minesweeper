require 'gosu'
require './Panel'

class MinesweeperWindow < Gosu::Window

  def initialize
    super 640, 480, false   ### false is for fullscreen
    self.caption = "Distributed Minesweeper"
    @panel = Panel.new(self, "test-panel.txt")
    @panel.print_panel
   # @c = Tile.new(self, true)

  end

  def update
  end

  def draw
    @panel.draw
  end

end

###############
###### x ######
##  0 1 2 3 4 5
##  1
##  2
#y  3
##  4
##  5