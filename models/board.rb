class Board
  attr_accessor :pc, :board, :battleship, :warship, :player_view, :points_hash
  # generates blank board
  def initialize (pc)
    @pc = pc
    @board = generate_blank_board
    @points_hash = {[] => 0}
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
    char = options[:type][0].upcase
    length = options[:length]
    x = options[:x]
    y = options[:y]
    orientation = options[:orientation]
    if orientation == 1 # horizontal
      # iterate "length" times, placing char as you go
      length.times do |n|
        @board[y][x+n] = char
      end
    else # vertical
      # iterate "length" times, placing char as you go
      length.times do |n|
        @board[y+n][x] = char
      end
    end
  end

  def display_board (*board)
    if board[0] == "player"
      puts "=========="
      puts "ENEMY ZONE"
    else
      puts "========="
      puts "#{@pc.upcase} ZONE"
    end
    puts "      a   b   c   d   e   ", "\n"
    n = 0
    if board[0] == "player" # use player view of computer board
      @player_view.each do |row|
        printable = "#{n+1} " if n < 4
        printable = "#{n+1}" if n == 4
        row.each {|item| printable << ("   " + item) }
        print " #{printable}\n\n" if n < 4
        print " #{printable}\n" if n == 4
        n += 1
      end
    else # use player view of player board if no arguments
      @board.each do |row|
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
    $message << "You are attacking #{@pc} !!!!! " unless $setup == true
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
    @player_view ||= generate_blank_board
    display_board("player")
    message
  end

  def show_player_view_of_player
    @player_view ||= generate_blank_board
    display_board
    message
  end

  # help! what do I do to avoid this repetition?
  def record_damage (x, y, ship_type) # Type = C, B, W, S, or D
    case ship_type
    when 'B'
      then @battleship.points[[x,y]] = '#'
    when 'W'
      then @warship.points[[x,y]] = '#'
    end
  end

  # help! what do I do to avoid this repetition?
  def report_if_sunk(ship_type)
    case ship_type
    when 'B'
      then $message << "Battleship sunk! " if @battleship.points.values.all? {|x| x == '#'}
      return true if @battleship.points.values.all? {|x| x == '#'}
    when 'W'
      then $message << "Warship sunk! " if @warship.points.values.all? {|x| x == '#'}
      return true if @warship.points.values.all? {|x| x == '#'}
    end
    $message << "Not sunk yet. "
    return false
  end

  def change_to_letters(ship_type)
    case ship_type
    when 'B'
      then @battleship.points.keys.each do |key|
        x, y = key[0], key[1]
        player_view[y][x] = 'B'
      end
    when 'W'
      then @warship.points.keys.each do |key|
        x, y = key[0], key[1]
        player_view[y][x] = 'W'
      end
    end
  end

  def determine_if_game_over
    if @battleship.points.values.all? {|x| x == '#'} &&
      @warship.points.values.all? {|x| x == '#'}
      # then
      $winner = @pc
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
