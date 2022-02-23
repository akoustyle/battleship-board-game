require 'ship'

class Board
  attr_accessor :grid
  def initialize
    @grid = {
      A: [1, 2, 3, 4, 5],
      B: [1, 2, 3, 4, 5],
      C: [1, 2, 3, 4, 5],
      D: [1, 2, 3, 4, 5],
      E: [1, 2, 3, 4, 5]
    }
    @boats = []
  end

  def add_ship(ship, position_start, direction)
    # ship = Instance of class Ship
    ship = Ship.new(length)
    # position_start = First coordinate on the grid. Ex: "C1"
    length = ship.length
    x = position_start[:x]
    y = position_start[:y]
    ship.length.times do
      if direction == :horizontal
          length.times do |n|
            self.board[y][x+n] = ship
          end
      else
        length.times do |n|
          self.board[y+n][x] = ship
        end
      end
  end

    # direction = "horizontal" or "vertical"
    # 1. Check if boat can be added on the grid depending of
      # - the position start
      # - the direction
      # - the boat size
    # 2. Check if there is no other ship on this emplacement (overlap)
  end
end
