class Ship
  attr_accessor :starting_coordinate, :direction
  def initialize(length)
    @length = length
    @starting_coordinate = nil
    @direction = nil
  end
end
