class Board
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
    # position_start = First coordinate on the grid. Ex: "C1"
    # direction = "horizontal" or "vertical"

    # 1. Check if boat can be added on the grid depending of
      # - the position start
      # - the direction
      # - the boat size
    # 2. Check if there is no other ship on this emplacement (overlap)
  end
end
