
require_relative '../models/board'


RSpec.describe 'Board' do

  describe 'generate a blank board' do
    it 'should create a blank board' do
      blank_board = Board.new('player')
    expect(blank_board.generate_blank_board).to be_a Array
    end
  end

  describe 'generate a player board' do
    it 'should create a player board' do
      player_board = Board.new('player')
    expect(player_board.class).to eq(Board)
    end
  end

  describe 'generate a player 2 board' do
    it 'should create a player 2 board' do
      player2_board = Board.new('player2')
    expect(player2_board.class).to eq(Board)
    end
  end

end

#testing
# RSpec.describe Board do
#   subject(:pc) do
#     ship1 = ship(origin: [0, 3])
#     ship2 = ship(origin: [0, 2])

#     Battlefield.new(ship1, ship2)
#   end

#   it 'can be instantiated with ship locations' do
#     expect(battlefield.ships.length).to eq 3
#   end

#   it 'can render itself' do
#     expected_render = "hey"
#     new_board = Board.new
#     new_board.generate_blank_board

#     expect(new_board.generate_blank_board).to eq expected_render
#   end

#   describe 'overlapping ships' do
#     [
#       [[ship(origin: [0, 0]), ship(origin: [0, 0])], :raise],
#       [[ship(origin: [0, 0]), ship(origin: [1, 0])], :raise],
#       [[ship(origin: [0, 0]), ship(origin: [3, 0])], :ok],
#       [[ship(origin: [2, 0]), ship(origin: [5, 0])], :ok],
#       [[ship(origin: [0, 0]), ship(origin: [0, 1])], :ok],
#     ].each do |ships, result|
#       it 'prevents overlapping ships' do
#         if result == :raise
#           expect { Battlefield.new(*ships) }.to raise_error Battlefield::OverlappingShipsError
#         else
#           expect { Battlefield.new(*ships) }.to_not raise_error
#         end
#       end
#     end
#   end

#   describe '#render_row' do
#     it 'renders a row given ships on that row' do
#       ship = ship(origin: [2, 0])
#       ship2 = ship(origin: [6, 0])

#       battlefield = Battlefield.new(ship, ship2)

#       expect(battlefield.render_row([ship])).to eq %w(- - X X X - - - - -)
#       expect(battlefield.render_row([ship, ship2])).to eq %w(- - X X X - X X X -)
#     end
#   end
# end
