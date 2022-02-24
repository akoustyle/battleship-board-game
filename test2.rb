# Board for player 1
board1 = []
# for i in 0..4
#   board1[i] = []
#   (0..4).each do
#     board1[i].append('O')
#   end
(0..4).each do |i|
  board1[i]=[]
  (0..4).each do
    board1[i].append('0')
  end
end

# Board for player 2
board2 = []
(0..4).each do |i|
  board2[i]=[]
  (0..4).each do
    board2[i].append('0')
  end
end

# Display the boards
def display_board(board)
  board.each do |row|
    puts row.map { |k| "#{k}" }.join('  ')
  end
end

# Generation of the player boards
array1 = [  [0, 1, 1, 1, 0], [1, 0, 0, 0, 0], [1, 0, 0, 0, 0], [1, 0, 0, 0, 0], [1, 0, 0, 0, 0] ]
array2 = [  [0, 0, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 1, 0, 1], [0, 0, 1, 0, 1], [0, 0, 1, 0, 1] ]

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
      puts 'Enter line number (between 1 and 5):'
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
      puts 'Enter line number (between 1 and 5):'
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
