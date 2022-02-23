#Start Game Sequence
#The player starts the game by running ruby battleship.rb from within your project directory
#Then they see:
#Welcome to BATTLESHIP

#Would you like to (p)lay or (q)uit?
#>
#If they enter p or play then they enter the ship layout described below.
#If they enter q or quit then the game should exit


# Player1 Ship Placement
# When the player1 decides to start a game, he chooses to play against another player # Validating Ship Coordinates
# Note that their are certain restrictions on where a ship can be placed. Specifically:

# Ships cannot wrap around the board
# Ships cannot overlap
# Ships can be laid either horizontally or vertically
# Coordinates must correspond to the first and last units of the ship. (IE: You can't place a two unit ship at "A1 A3")

# Player2 Ship Placement
# After the palyer1 has placed its ships, the player2 should see:

# I have laid out my ships on the grid.
# You now need to layout your two ships.
# The first is two units long and the
# second is three units long.
# The grid has A1 at the top left and D4 at the bottom right.

# Enter the squares for the two-unit ship:
# Player Entering Ship Coordinates
# Then they enter coordinates like this:

# A1 A2
# Which places the two element ship on squares A1 and A2. Then it asks for the coordinates for the three-unit ship.

# Player ship positions should be validated according to the same rules listed above.
# If a user enters an invalid ship coordinate, the game should display a message explaining which of the rules their choice violated, then ask them to re-enter all coordinates for that specific ship. (Any previous ship placements should still be retained)

# Once all ships have been placed, the user can enter the main game flow phase.

# Game Flow (Main Phase)
# During the main game, players take turns firing at one another by selecting positions on the grid to attack.

# Rendering the Game Grid
# During this phase the game will frequently need to display the current game view. We'll use a simple ASCII text grid of letters (to indicate rows) and numbers (to indicate columns).

# Your board will look something like this:

# ===========
# . 1 2 3 4
# A
# B
# C
# D
# ===========

# Player Shot Sequence
# Once the ships are laid out the game starts with the Player Shoots Sequence.

# Display the map from the current player's point of view
# Prompt the player for a position on which to fire
# Indicate whether that shot was a hit or a miss and display an updated map
# 1. Displaying the map
# Display a map using the format described above. On the map, include information about the current player's previous shots. For every shot that landed a hit, mark that position with an H, and fore very shot that missed, mark that position with an M.

# So, on the first turn, a player's grid will look empty. But as the game progresses, it will gradually fill up with misses and hits:

# ===========
# . 1 2 3 4
# A H M
# B H   M
# C   H M
# D
# ===========
# 2. Prompting Player for a Shot
# At the bottom of the grid display, the board should include a message prompting the player to enter a coordinate to fire on. This should follow the same pattern as when placing ships -- a letter/number combination to indicate the row and column to hit.

# You should validate that the player's choice is a valid coordinate on the board, and that they have not already fired on that position before. (If they have, display a message explaining these constraints)

# Ship Hit Sequence
# If the hit did not sink the ship, tell them that they hit an enemy ship
# If the hit sunk the ship, tell them they sunk it and the size of the ship.
# If the hit sunk the ship and it was the last enemy ship, then enter the End Game Sequence
# End Game Sequence
# When either the player or computer wins the game...

# Output a sorry or congratulations message
# Output how many shots it took the winner to sink the opponent's ships
# Output the total time that the game took to play
