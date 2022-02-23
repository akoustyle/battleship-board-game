require 'rspec'
require 'ship'

class ShipTest

  describe Ship do
    it " sums the hits for each turn" do
      ship = Ship.new
      5.times {ship.hits}
      expect(ship.hits).to eq(5)
    end
  end

end
