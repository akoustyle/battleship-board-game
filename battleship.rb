require "./helper_battleship.rb"

$winner = nil # tells parser who the winner is; nil = game not over
$message = '' # stuff that is saved to be displayed to the user after the board
$testing = false
# enclosing loop
game_on = true
while game_on == true
  player2_board, player_board = play_game
  # reports results and prompts for another game
  report_and_prompt(player2_board, player_board)
  game_on = false
end
