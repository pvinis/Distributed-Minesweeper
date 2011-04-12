class Panel
  attr_reader :height, :width, :tiles
  ## tiles

  def initialize(filename)
    tiles_from_file(filename)
  end

  def tiles_from_file(filename)
    tiles_from_array(array_from_file(filename))
  end

  MINE = '*'
  EMPTY = '.'
  def array_from_file(filename)
    file = File.open filename
    @width,@height = file.readline("\n").chomp.split(":")
    panel = []
    file.each_line do |line|
      line.chomp!
      tileline = []
      line.each_char do |c|
        case c
          when MINE
            tileline << MINE
          when EMPTY
            tileline << EMPTY
        end
      end
      panel << tileline  ### if tileline einai to sosto width
    end
    return panel ## if to panel einai to sosto height
  end

  def tiles_from_array(p)
    p
  end

  def num_of_bombs_near

  def print_panel
    puts "height:#{@height}"
    puts "width:#{@width}"
    @panel.each do |tileline|
      tileline.each do |c|
        print c
      end
      print "\n"
    end
  end
end
