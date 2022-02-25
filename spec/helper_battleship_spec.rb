
require_relative '../helper_battleship'

RSpec.describe 'testing the app helper' do
  describe 'setup_game' do
    it 'does not raise error' do
      allow(Input).to receive(:get_orientation).and_return 'h'
      allow(Input).to receive(:get_coordinates).and_return('a1', 'a2', 'a3', 'a4', 'a5')
      expect { setup_game }.to_not raise_error
    end
  end

  describe 'Whos turn?' do
    it 'Toss game does not raise error' do
      expect { flip_to_see_who_goes_first }.to_not raise_error
    end
  end
end
