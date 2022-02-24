class Board
  attr_accessor :pc, :board, :battleship, :warship, :player_view, :points_hash

  # generates blank board
  def initialize (pc)
    @pc = pc
    @board = generate_blank_board
    self.points_hash = {[] => 0}
  end

  def generate_blank_board
    blank_board = []
    5.times do |y|
      blank_board[y] = []
      5.times { |x| blank_board[y][x] = "." }
    end
    # Note, x is horizontal, y is vertical, counting from upper left
    # Also, x are the nested array indices, y is outer indices: [y][x]
    blank_board
  end

  def write_ship_to_board(options)
    name = options[:type][0].upcase
    length = options[:length]
    x = options[:x]
    y = options[:y]
    orientation = options[:orientation]
    if orientation == 1 # horizontal
      # iterate "length" times, placing name as you go
      length.times do |n|
        self.board[y][x+n] = name
      end
    else # vertical
      # iterate "length" times, placing name as you go
      length.times do |n|
        self.board[y+n][x] = name
      end
    end
  end

  def display_board (*board)
    if board[0] == "player"
      puts "=========="
      puts "ENEMY ZONE"
    else
      puts "========="
      puts "#{self.pc.upcase} ZONE"
    end
    puts "      a   b   c   d   e   ", "\n"
    n = 0
    if board[0] == "player" # use player view of computer board
      self.player_view.each do |row|
        printable = "#{n+1} " if n < 4
        printable = "#{n+1}" if n == 4
        row.each {|item| printable << ("   " + item) }
        print " #{printable}\n\n" if n < 4
        print " #{printable}\n" if n == 4
        n += 1
      end
    else # use player view of player board if no arguments
      self.board.each do |row|
        printable = "#{n+1} " if n < 4
        printable = "#{n+1}" if n == 4
        row.each {|item| printable << ("   " + item) }
        print " #{printable}\n\n" if n < 4
        print " #{printable}\n" if n == 4
        n += 1
      end
    end
    print "\n"
  end

  def get_valid_coords(*type)
    x = 0
    y = 0
    valid_start = false
    $message << "#{self.pc} attack! " unless $setup == true
    until valid_start
      if type[0]
        puts "Where do you want the top/left edge of your #{type[0]}? "
      else
        print "Missile ready to launch. Coordinate? "
      end
      print "E.g., a1: "
      coords = Input.get_coordinates
      begin
        x = coords[0]
        coords[0] = ''
        y = coords.to_i
        valid_start = true if "abcde".include?(x) && x.length == 1 && y.between?(1,5)
      rescue ArgumentError, TypeError
        puts "Format example: a1 "
        next
      end
    end
    # convert human coords into array indices
    return "abcde".index(x), y-1
  end

  def show_player_view
    self.player_view ||= generate_blank_board
    display_board("player")
    message
  end

  def show_player_view_of_player
    self.player_view ||= generate_blank_board
    display_board
    message
  end

  # help! what do I do to avoid this repetition?
  def record_damage (x, y, ship_type) # Type = C, B, W, S, or D
    case ship_type
    when 'B'
      then self.battleship.points[[x,y]] = '#'
    when 'W'
      then self.warship.points[[x,y]] = '#'
    end
  end

  # help! what do I do to avoid this repetition?
  def report_if_sunk(ship_type)
    case ship_type
    when 'B'
      then $message << "Battleship sunk! " if self.battleship.points.values.all? {|x| x == '#'}
      return true if self.battleship.points.values.all? {|x| x == '#'}
    when 'W'
      then $message << "Warship sunk! " if self.warship.points.values.all? {|x| x == '#'}
      return true if self.warship.points.values.all? {|x| x == '#'}
    end
    $message << "Not sunk yet. "
    return false
  end

  def change_to_letters(ship_type)
    case ship_type
    when 'B'
      then self.battleship.points.keys.each do |key|
        x, y = key[0], key[1]
        player_view[y][x] = 'B'
      end
    when 'W'
      then self.warship.points.keys.each do |key|
        x, y = key[0], key[1]
        player_view[y][x] = 'W'
      end
    end
  end

  def determine_if_game_over
    if self.battleship.points.values.all? {|x| x == '#'} &&
      self.warship.points.values.all? {|x| x == '#'}
      # then
      $winner = self.pc
      # winner is the opposite of the one whose board is being changed
      case $winner
      when "player"
        then $winner = "player2"
      when "player2"
        then $winner = "player"
      end
      $message << "We have a winner! "
    else
      $message << "No winner yet. "
    end
  end

  def compu_coords_to_human_coords (x,y)
    # puts "x = #{x}, y = #{y}" # FOR TESTING
    x = "abcde"[x]
    y += 1
    return x, y
  end

  def determine_damage (x, y)
    ship_type = board[y][x]
    hit = false
    x_human, y_human = compu_coords_to_human_coords(x,y)
    $message << "Trying #{x_human}#{y_human}. "
    # edit player_view based on hit/miss
    case board[y][x]
      when '.'
        then $message << "\nMISS! "
        player_view[y][x] = 'x'
        board[y][x] = 'x'
      when 'B', 'W'
        then $message << "\nHIT! "
        hit = true
        player_view[y][x] = '#'
        # This overwrites the board but ship coords are in ship object
        if pc == "player2"
          board[y][x] = "#"
        elsif pc == "player"
          board[y][x] = board[y][x].downcase
        end
        record_damage(x, y, ship_type)
        sunk = report_if_sunk(ship_type)
        change_to_letters(ship_type) if sunk == true
        determine_if_game_over if sunk == true
      else
        $message << "Invalid coordinates: #{x_human}#{y_human}. "
        show_player_view
        return hit, false # ship not sunk, and coordinates were bad
    end

    return hit, true # i.e., whether ship was sunk, and if coordinates were OK
  end

end

class Player2Board < Board

  def initialize (pc)
  puts "|"
  puts "|"
  puts "|"
  puts "|"
  puts "|"
  puts "|"
  puts "|"
  puts "|"
  puts "|"
  puts "|"
  puts "|"
  puts "|"
  puts "|"
    puts "Generating Player2's board."
    super
    self.pc = "player2" # is there a way to avoid this??
    place(4, "battleship")
    place(3, "warship")
  end

  def test_legality_of_x_and_y(x, y, length, type, orientation, position_found)
    if orientation == 0 # horizontal
      pass = true
      # iterate "length" times, checking each position as you go
      length.times do |n|
        begin # wrap to catch off-board exceptions
          # check if position already occupied
          unless self.board[y+n][x] == "."
            pass = false
            puts "That position is invalid."
          end
        rescue NoMethodError
          pass = false
          puts "Error. That position is invalid."
          break
        end
        break unless pass
      end
      if pass == true
        position_found = true
      end
    else # vertical
      pass = true
      # iterate "length" times, checking each position as you go
      length.times do |n|
        begin # wrap to catch off-board exceptions
          # check if position already occupied
          unless self.board[y][x+n] == "."
            pass = false
            puts "That position is invalid."
          end
        rescue NoMethodError
          pass = false
          puts "That position is invalid."
          break
        end
        break unless pass
      end
      if pass == true
        position_found = true
      end
    end
    return x, y, position_found
  end

  def place(length, type)
    self.display_board unless $testing
    $message unless $testing
    position_found = false
    orientation = nil
    valid_orientation = false

    # ask for a position until a valid one is chosen
    until position_found
      # choose horizontal or vertical
      orient = ""
      until valid_orientation
        print "Do you want your #{type} [h]orizontal or [v]ertical? "
        orient = Input.get_orientation
        if (orient == "h")
          orientation = 1
          valid_orientation = true
        elsif (orient == "v")
          orientation = 0
          valid_orientation = true
        else
          puts "Please, either 'h' or 'v'."
        end
      end
      # solicit valid x and y from player
      x, y = get_valid_coords(type)
      # test legality of proposed placement points within board array
      x, y, position_found = test_legality_of_x_and_y(x,y,length,type,orientation,position_found)
    end

    # save ship
    case type
      when "battleship"
        then @battleship = Ship.new(type: type, length: length, x: x, y: y, orientation: orientation)
      when "warship"
        then @warship = Ship.new(type: type, length: length, x: x, y: y, orientation: orientation)
    end

    # write to board
    write_ship_to_board(type: type, length: length, x: x, y: y, orientation: orientation)
    show_player_view_of_player
  end
end

class PlayerBoard < Board
  def initialize (pc)
    super
    self.pc = "player" # is there a way to avoid this??
    puts "Let's set up your board!\n\n"
    place(4, "battleship")
    place(3, "warship")
  end

  def test_legality_of_x_and_y(x, y, length, type, orientation, position_found)
    if orientation == 0 # horizontal
      pass = true
      # iterate "length" times, checking each position as you go
      length.times do |n|
        begin # wrap to catch off-board exceptions
          # check if position already occupied
          unless self.board[y+n][x] == "."
            pass = false
            puts "That position is invalid."
          end
        rescue NoMethodError
          pass = false
          puts "Error. That position is invalid."
          break
        end
        break unless pass
      end
      if pass == true
        position_found = true
      end
    else # vertical
      pass = true
      # iterate "length" times, checking each position as you go
      length.times do |n|
        begin # wrap to catch off-board exceptions
          # check if position already occupied
          unless self.board[y][x+n] == "."
            pass = false
            puts "That position is invalid."
          end
        rescue NoMethodError
          pass = false
          puts "That position is invalid."
          break
        end
        break unless pass
      end
      if pass == true
        position_found = true
      end
    end
    return x, y, position_found
  end

  def place(length, type)
    self.display_board unless $testing
    $message unless $testing
    position_found = false
    orientation = nil
    valid_orientation = false


    # ask for a position until a valid one is chosen
    until position_found
      # choose horizontal or vertical
      orient = ""
      until valid_orientation
        print "Do you want your #{type} [h]orizontal or [v]ertical? "
        orient = Input.get_orientation
        if (orient == "h")
          orientation = 1
          valid_orientation = true
        elsif (orient == "v")
          orientation = 0
          valid_orientation = true
        else
          puts "Please, either 'h' or 'v'."
        end
      end
      # solicit valid x and y from player
      x, y = get_valid_coords(type)
      # test legality of proposed placement points within board array
      x, y, position_found = test_legality_of_x_and_y(x,y,length,type,orientation,position_found)
    end


    # save ship
    case type
      when "battleship"
        then @battleship = Ship.new(type: type, length: length, x: x, y: y, orientation: orientation)
      when "warship"
        then @warship = Ship.new(type: type, length: length, x: x, y: y, orientation: orientation)
    end

    # write to board
    write_ship_to_board(type: type, length: length, x: x, y: y, orientation: orientation)
    show_player_view_of_player
  end
end

class Input
  def self.get_coordinates
    # gets.chomp
    tries = gets        # get input
    tries ||= ''        # set to empty string if nil
    tries.chomp!
  end
  def self.get_orientation
     # gets.chomp
    tries = gets        # get input
    tries ||= ''        # set to empty string if nil
    tries.chomp!
  end
end
