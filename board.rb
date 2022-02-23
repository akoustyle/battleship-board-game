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
    # length = ship.length
    # position_start = First coordinate on the grid. Ex: "C1"
    x = position_start[:x]
    y = position_start[:y]

    # direction = "horizontal" or "vertical"
    ship.length.times do
      if direction == :horizontal
          length.times do |n|
            self.board[y][x+n] = ship
          end
      else # direction = "vertical"
        length.times do |n|
          self.board[y+n][x] = ship
        end
      end
  end
    # 1. Check if boat can be added on the grid depending of
      # - the position start
      # - the direction
      # - the boat size

    # 2. Check if there is no other ship on this emplacement (overlap)
    def ensure_no_overlapping_ships!
      ships_by_rows = ships.group_by { |s| s[:origin][1] }
      ships_by_rows.each do |_, ships|
      sorted_ships = ships.sort_by { |s| s[:origin][0] }
      first_ship = sorted_ships.first
      last_ship  = sorted_ships.last

      area = (last_ship[:origin][0] + last_ship[:length]) - first_ship[:origin][0]
      overlap = area < ships.sum { |s| s[:length ]}
      # if overlap raise error
      end
    end
  end
end
