class Ship
  attr_accessor :starting_coordinate, :direction, :hits, :fill_char
  def initialize(length)
    @length = length
    @starting_coordinate = nil
    @direction = nil
    @hits = 0
  end

  def hits
    @hits += 1
  end

  def sunk?
    @length == @hits
  end

  def to_s
		@fill_char.colorize(:light_blue)
	end
end


ship = Ship.new(4)
 puts ship.hits
