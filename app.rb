require_relative "ship"
require_relative "board"

player_1_ships = [Ship.new(4), Ship.new(3)]
player_2_ships = [Ship.new(4), Ship.new(3)]

player_1_board = Board.new
player_2_board = Board.new


# Try to add the first ship on the board

# 1. Ask to user how he wants to place his ship
ship = player_1_ships.first
puts "Starting coordinate?"
print "> "
coordinate = gets.chomp
ship.starting_coordinate = coordinate

puts "Direction?"
puts "1 - Horizontal"
puts "2 - Vertical"
print "> "
direction = gets.chomp.to_i
ship.starting_coordinate = (direction == 1 ? "horizontal" : "vertical")

# Then tried to add to his board
player_1_board.add_ship(ship)
