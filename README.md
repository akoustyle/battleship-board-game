# How to play
Each player have 5x5 grid, a battleship(4x1) and a warship(3x1), to start the game you will need to go:

In your teminal and tap this command
```bash
ruby battleship.rb
```

# Setup
Make sure Ruby is installed on your system.
Run  from the command line.
```bash
ruby -v
```

Run the program and follow the on-screen prompts.



# Gameplay
## There are two phases:

1️⃣ Setup game

**To setup the game**, for each ship, simply choose **h or v for horizontal and vertical**, then the coordinates (with lowercase letter followed by number, e.g., a1). You will place the ship according to the top/left of the ship and to the orientation (v or h) you previously have chosen. Each player have to place their ships whithin the grid(5x5).

2️⃣ Play game

**To play**, simply type in coordinates of your attacks, for example c4, if you touch the opponent ship, the terminal will print a ' # ' then you can keep playing. If you don't hit a ship the terminal will print a ' x ', it would be the other player turn. To make the game more readable, there are many *"Enter to continue..."* prompts between each turn.

In order to win you need to touch all ships of the opponent !!!

##Happy battle!!!


# Test

Make sure to have the gem rspec install in your gemfile
then

Tap those command
```bash
rspec spec/helper_battleship_spec.rb
```
```bash
rspec spec/board_spec.rb
```
```bash
rspec spec/ship_spec.rb
```
