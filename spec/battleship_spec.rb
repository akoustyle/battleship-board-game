require_relative '../app_game.rb'

RSpec.describe 'app methods' do

  describe "setup_game" do
    it "does not raise error" do
      allow(Input).to receive(:get_orientation).and_return "h"
      allow(Input).to receive(:get_coordinates).and_return("a1", "a2", "a3", "a4", "a5")
      expect{ setup_game }.to_not raise_error
    end
  end

  describe "Whos turn?" do
    it "does not raise error" do
      # allow(Input).to receive(:get_orientation).and_return "h"
      # allow(Input).to receive(:get_coordinates).and_return("a1", "a2", "a3", "a4", "a5")
      expect{ flip_to_see_who_goes_first }.to_not raise_error
    end
  end

  # describe "play_game" do
  #   it "does not raise error" do
  #     # allow(Input).to receive(:get_orientation).and_return "h"
  #     # allow(Input).to receive(:get_coordinates).and_return("a1", "a2", "a3", "a4", "a5", "b1", "b2", "b3", "b4", "b5", "c1", "c2", "c3", "c4", "c5", "d1", "d2", "d3", "d4", "d5", "e1", "e2", "e3", "e4", "e5")
  #     expect{ play_game }.to_not raise_error
  #   end
  # end

end
