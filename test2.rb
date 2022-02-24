# Board for player 1
def board1
  board1 = []
  ('a'..'e').each do |i|
    board1[i]=[]
    (0..4).each do
      board1[i].append('0')
    end
  end
end

# n = 4
# rows = (:a..:z).first(n)
# cols = (1..n).to_a
# cells = rows.product(cols).map(&:join)
# #=> ["a1", "a2", "a3", "a4", "b1", "b2", "b3", "b4", "c1", "c2", "c3", "c4", "d1", "d2", "d3", "d4"]
# table = cells.map { |coord| [coord, Cell.new(coord)] }.to_h

# Board for player 2
def board2
  board2 = []
  ('a'..'e').each do |i|
    board2[i]=[]
    (0..4).each do
      board2[i].append('0')
    end
  end
end

# Display the boards
def display_board(board)
  board.each do |row|
    puts row.map { |k| "#{k}" }.join('  ')
  end
end

# Generation of the player ships
array1 = [  [0, 1, 1, 1, 0], [1, 0, 0, 0, 0], [1, 0, 0, 0, 0], [1, 0, 0, 0, 0], [1, 0, 0, 0, 0] ]
array2 = [  [0, 0, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 1, 0, 1], [0, 0, 1, 0, 1], [0, 0, 1, 0, 1] ]

# def wouldFitEast(ship, anArray, posX, posY)
#   steps = 0
#   while (steps < N)
#       posX = posX + 1
#       if !validArrayIndex(posX, posY) or anArray[posX][posY] == 1
#           return false;
#       steps = steps + 1
#   return true;
#       end
#   end
# end
# Initialization of  2 ships
# def ship1
#   length = 4
# end
# def ship2
#   length = 3
# end

ships = {
	s1: 4,
	s2: 3,
}

loop do
	puts 'Select ship type[s1, s2]:'
	puts 'Remaining ships:'
	pp ships
	ship_type = gets.chomp

	if %w(s1 s2).include?(ship_type)
		if ships[ship_type.to_sym] > 0
			ships[ship_type.to_sym] -= 1
			current_ship = ship_type
			break;
		else
			puts "Don't have more ships of this type."
		end
	else
		puts 'Incorrect ship type.'
	end
end

loop do
	puts 'Enter first position of ship[a1, a2, b4, etc.]:'
	first_pos = gets.chomp

	if check_letter(first_pos) && check_number(first_pos)
		#TODO: Check that the cell is not occupied, check that next to the cell is not necessary to ship
		if in_not_ship_behind(position)
			puts 'yeah'
		else
			puts 'nope'
		end
		break;
	else
		puts 'Incorrect position.'
	end
end


loop do
	if ship_type.to_sym = 1
		to_next_ship           #Сheck that the deck of the ship has 1 space
	else
		gets second_pos
		break;
	end
end


loop do
	puts 'Enter second position of ship[a1, a2, b4, etc.]:'
	second_pos = gets.chop

	#TODO: Check that first position located near second position
	#TODO: Check the validations like in first position
	#TODO: Check that the ship cannot be bend (must be in one row horizontally or vertically)
	#TODO: Check whether the cells did not end while building the chip type and gets the following cell
	break;

end
# A player wins when he/she reaches 7 points (2 ships each to place on their grid : a small ship (3x1 side) and a large one (4x1 size))
solution = 7

# We set the number of points at 0 at the start of the game
wins_p1 = 0
wins_p2 = 0

#Starting of the game and printing the board
while true do
  puts 'Welcome!'
  puts 'Enter start or stop'
  starting = gets.chomp
  puts "\n"

  case starting.downcase
  when 'start'
    puts 'Enter the name of P1'
    name_p1 = gets.chomp
    puts "\n"
    puts 'Enter the name of P2'
    name_p2 = gets.chomp
    puts "\n"

    while wins_p1 < solution || wins_p2 < solution
      puts "--- #{name_p1.upcase}'S TURN ---"
      puts 'Enter line letter (between A and E):'
      row_p1 = gets.chomp.to_i-1
      puts 'Enter column number (between 1 and 5):'
      column_p1 = gets.chomp.to_i-1

      case array1[row_p1][column_p1]
      when 1
        board1[row_p1][column_p1] = 'X'
        wins_p1 += 1
      when 0
        board1[row_p1][column_p1] = '-'
      when 'X', '-'
        next
      end

      puts "\n"
      puts '--------------'
      display_board(board1)
      puts '--------------'
      puts '----------------------'
      puts "#{name_p1} has #{wins_p1} point#{"s" if wins_p1 > 1}."
      puts '----------------------'
      puts "\n"

    break if wins_p1 == solution

      puts "--- #{name_p2.upcase}'S TURN ---"
      puts 'Enter line letter (between A and E):'
      row_p2 = gets.chomp.to_i-1
      puts 'Enter column number (between 1 and 5):'
      column_p2 = gets.chomp.to_i-1

      case array2[row_p2][column_p2]
      when 1
        board2[row_p2][column_p2] = 'X'
        wins_p2 += 1
      when 0
        board2[row_p2][column_p2] = '-'
      when 'X', '-'
        next
      end

      puts "\n"
      puts '--------------'
      display_board(board2)
      puts '--------------'
      puts '----------------------'
      puts "#{name_p2} a #{wins_p2} point#{"s" if wins_p2 > 1}."
      puts '----------------------'
      puts "\n"
      break if wins_p2 == solution
    end

    puts "#{name_p1}, you are the winner!" if wins_p1 == solution
    puts "#{name_p2}, you are the winner!" if wins_p2 == solution
    puts "\n"
    break

  when 'stop'
    puts 'See you soon!'
    break
  else
    puts 'Enter start or stop only!'
    puts "\n"
  end
end
