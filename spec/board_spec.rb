
require_relative '../board'


RSpec.describe 'Board' do

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
