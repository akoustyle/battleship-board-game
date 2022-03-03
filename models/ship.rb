class Ship
  attr_accessor :type, :char, :length, :x, :y, :orientation, :points

  def initialize(options)
    @type = options[:type]
    @char = options[:type][0].upcase
    @length = options[:length]
    @x = options[:x]
    @y = options[:y]
    @orientation = options[:orientation]
    initialize_ship_points
  end

  def initialize_ship_points
    # a hash of ship points, with keys = an array of coordinates
    # and values = state of that point ('.' or '#')
    @points = {}
    if orientation == "h" # vertical
      length.times do |n|
        points[[x, y + n]] = '.'
      end
    else orientation == "v" # horizontal
      length.times do |n|
        points[[x + n, y]] = '.'
      end
    end
  end
end
