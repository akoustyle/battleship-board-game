require_relative './input'
require_relative './ship'
require_relative './board'

class PlayerBoard < Board
  def initialize (pc)
    super
    @pc = "player" # is there a way to avoid this??
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
          unless @board[y+n][x] == "."
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
          unless @board[y][x+n] == "."
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
    message unless $testing
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
    puts " #{type.capitalize} placed"
  end
end
