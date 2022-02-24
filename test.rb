require 'pp'

def check_letter(position)
	%w(a b c d e ).include?(position[0])
end

def check_number(position)
	%w(1 2 3 4 5).include?(position[1..-1]) #pull the first character of a string
end

def check_is_ship_behind(position)
	#TODO realization
end

blank_row = Array.new(10,"0")
board = Array.new(10) { blank_row.clone }

def print_board(board)
  board = []
  board 10.times { board << ("0" * 5)}
end

board = {
	a: [false, false, false, false, false, false, false, false, false, false],
	b: [false, false, false, false, false, false, false, false, false, false],
	c: [false, false, false, false, false, false, false, false, false, false],
	d: [false, false, false, false, false, false, false, false, false, false],
	e: [false, false, false, false, false, false, false, false, false, false],
	f: [false, false, false, false, false, false, false, false, false, false],
	g: [false, false, false, false, false, false, false, false, false, false],
	h: [false, false, false, false, false, false, false, false, false, false],
	i: [false, false, false, false, false, false, false, false, false, false],
	j: [false, false, false, false, false, false, false, false, false, false]
}

puts '   1 2 3 4 5 6 7 8 9 10'

board.each do |key, row|
	string = ''
	row.each do |v|
		if v
			string += ' S'
		else
			string += ' .'
		end
	end

	puts key.to_s + ' ' + string
end

ships = {
	s1: 4,
	s2: 3,
	s3: 2,
	s4: 1
}

loop do
	puts 'Select ship type[s1, s2, s3, s4]:'
	puts 'Remaining ships:'
	pp ships
	ship_type = gets.chomp

	if %w(s1 s2 s3 s4).include?(ship_type)
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
	first_pos = gets.chop

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

def test (position)
  x, y = position
  return true if board[y][x]
  return true if board[y-1][x-1]
  return true if board[y-1][x]
  return true if board[y][x-1]
  return true if board[y+1][x+1]
  return true if board[y+1][x]
  return true if board[y][x+1]
  false
end
def test(postition)
	letter = position[0]

	#   1 2 3
	# A O . .
	# B x . .
	# C . . .

	keys = board.keys
	index = keys.find_index(letter)
	prev_key = keys[index - 1] #up-down
	unless prev_key.nil?
		is_ship_placed = board[prev_key][postition[1]] #left-right
	end

	#   1 2 3
	# A O . .
	# B . . .
	# C . . .

end
