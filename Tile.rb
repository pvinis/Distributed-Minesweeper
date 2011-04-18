require 'gosu'
require './Point'

class Tile

  def initialize(window, position, bomb, around)
    @window = window
    @position = position
    @bomb = bomb
    @bombs_around = around
    ###@state = State::CLOSED
    @state = State::OPEN
    @closed_image = Gosu::Image.new(@window, "./Tiles/Closed.png", true)  ## afta ta tria pou einai static na ta valo kapou allou, oxi mesa e kathe tile
    @pressed_image = Gosu::Image.new(@window, "./Tiles/Pressed.png", true)
    @final_image = Gosu::Image.new(@window, "./Tiles/FinalBomb.png", true)
    if @bomb
      img = "Bomb" if @bomb
    else
      img = @bombs_around.to_s
    end
    @opened_image = Gosu::Image.new(@window, "./Tiles/"+img+".png", true)
    @image_height = @opened_image.height
    @image_width = @opened_image.width
  end

  def is_bomb?
    @bomb
  end

  def update
  end

  def draw
    case @state
      when State::CLOSED
       @closed_image
      when State::PRESSED
        @pressed_image
      when State::OPEN
        @opened_image
    end.draw(@position.x*@image_width, @position.y*@image_height, 0)
  end
end

class State
  CLOSED  = 1
  PRESSED = 2
  OPEN    = 3
end