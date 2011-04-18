require './Tile'
require './Point'

class Panel

  def initialize(window, filename)
    @window = window
    tiles_from_array(array_from_file(filename))
  end

  def update

  end

  def draw
    @tiles.each do |line|
      line.each do |tile|
        tile.draw
      end
    end
  end

  def tiles_from_array(tile_array)
    p = Point.new(0,0)
    @tiles = []
    tile_array.each do |tile_line|
      p.x = 0
      line = []
      tile_line.each do |t|
        case t
          when MINE
            line << Tile.new(@window, p.clone, true, 0)
          when EMPTY
            line << Tile.new(@window, p.clone, false, bombs_around(p, tile_array))
        end
        p.x += 1
      end
      @tiles << line
      p.y += 1
    end
    @tiles
  end

  def bombs_around(point, tile_array)
    b = 0
    points = [point.up.left,    point.up,   point.up.right,
              point.left,                   point.right,
              point.down.left,  point.down, point.down.right]
    points.each do |p|
      b += 1 if p.x >= 0 and p.x < @width and p.y >= 0 and p.y < @height and tile_array[p.y][p.x] == MINE
    end
    b
  end


  MINE = '*'
  EMPTY = '.'
  def array_from_file(filename)
    file = File.open(filename)
    @width,@height = file.readline("\n").chomp.split(":")
    @width = @width.to_i
    @height = @height.to_i
    tile_array = []
    file.each_line do |line|
      line.chomp!
      tile_line = []
      line.each_char do |c|
        tile_line << c
      end
      tile_array << tile_line       ## an einai sosto to width
    end
    tile_array                      ## an einai sosto to height
  end

  def print_panel
    puts "width:#{@width}"
    puts "height:#{@height}"
    @tiles.each do |tile_line|
      tile_line.each do |t|
        case t.is_bomb?
          when true
            print '*'
          when false
            print '.'
        end
      end
      print "\n"
    end
  end

end
