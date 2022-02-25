require_relative '../models/board'

RSpec.describe 'Board' do
  it 'should create a blank board' do
    blank_board = Board.new('player')
    expect(blank_board.generate_blank_board).to be_a Array
  end

  it 'should create a player board' do
    player_board = Board.new('player')
    expect(player_board.class).to eq(Board)
  end

  it 'should create a player 2 board' do
    player2_board = Board.new('player2')
    expect(player2_board.class).to eq(Board)
  end
end
