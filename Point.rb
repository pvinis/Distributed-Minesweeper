class Point

  attr_accessor :x, :y

  def initialize(x=0, y=0)
    @x = x
    @y = y
  end

  def up
    Point.new(@x, @y-1)
  end

  def down
    Point.new(@x, @y+1)
  end

  def left
    Point.new(@x-1, @y)
  end

  def right
    Point.new(@x+1, @y)
  end
end