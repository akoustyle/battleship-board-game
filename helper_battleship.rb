require "./models/board.rb"
require "./models/ship.rb"
require "./models/player_board"
require "./models/player2_board"
require "./models/input"

# This is called just after displaying a board, so that $messages appear
# below the board instead of above them.
def message
  puts $message
  $message = ''
end

def setup_game
  $setup = true # turns off an irrelevant $message
  # system("cls")
  puts "######################"
  puts "Welcome to Battleship!"
  puts "To play, first you'll place your battleships on a 5x5 grid."
  puts "Then you'll take shots (also on the grid) at the opponent's area"
  puts "to eliminate their ships. They will be shooting at you, too!"
  puts "Sink all the opponent's ships before yours are sunk!"
  puts "######################\n\n"
  player_board = PlayerBoard.new("player")
  player_board.player_view = player_board.generate_blank_board
  player_board.display_board
  player2_board = Player2Board.new("player2")
  player2_board.player_view = player2_board.generate_blank_board
  player2_board.display_board
  $message << "Setup complete! Let's play! "
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
  $message
  $setup = false
  return player2_board, player_board
end

def flip_to_see_who_goes_first
  result = rand(2)
  return nil if result == 0
  "player"
end

def player_turn(*player2_board)
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
  $message << "Player turn! "
  hit = true # to get into the while loop
  # continue as long as player is hitting
  while hit == true
    hit = false # hasn't hit yet
    # show player what he knows of enemy board
    player2_board.show_player_view
    valid_coords = false
    until valid_coords
      x, y = player2_board.get_valid_coords
      # determine_damage returns 'false' if already attacked coords
      hit, valid_coords = player2_board.determine_damage(x, y)
      return if $winner
    end
  end
  # show player view of player2 board at end of player turn
  player2_board.show_player_view
  print "Enter to continue..."
  gets
end

def player2_turn(*player_board)
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
  $message << "Player2 turn! "
  hit = true # to get into the while loop
  # continue as long as player is hitting
  while hit == true
    hit = false # hasn't hit yet
    # show player what he knows of enemy board
    player_board.show_player_view
    valid_coords = false
    until valid_coords
      x, y = player_board.get_valid_coords
      # determine_damage returns 'false' if already attacked coords
      hit, valid_coords = player_board.determine_damage(x, y)
      return if $winner
    end
  end
  # show player2 view of player board at end of player turn
  player_board.show_player_view
  print "Enter to continue..."
  gets
end


def play_game
  player2_board, player_board = setup_game
  player_move = flip_to_see_who_goes_first
  puts "The #{player_move ? "player" : "player2"} won the toss."
  # code to play game goes here
  until $winner # i.e., until a winner is determined
    player_move ? player_turn(player2_board, player_board) :
      player2_turn(player2_board, player_board)
    # toggle until game ends
    player_move ? player_move = false : player_move = true
  end
  return player2_board, player_board
end

def report_and_prompt(player2_board, player_board)
  $winner == "player" ? player2_board.show_player_view_of_player :
    player_board.show_player_view
  puts "The winner of this round is the #{$winner.upcase}!"
end
