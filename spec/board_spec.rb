
require_relative '../board'


RSpec.describe 'Board' do
  before do
    @board = Board.new
  end

  describe 'generate_blank_board' do
    it 'should create a blank board' do
      @blank_board = blank_board
      return blank_board
    expect{ blank_board }.to eq(blank_board)
    end
  end

  describe 'player' do
    it 'should initiate a player' do
      p = Board.new

    expect{p.pc}.to eq('player')
    end
    it 'should initiate a player 2' do
      p2 = Board.new

    expect{p2.pc}.to eq('player2')
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
