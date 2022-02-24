require_relative '../models/ship'


class ShipTest

  describe Ship do
    it " should create a ship" do
      ship = Ship.new(type: type, length: length, x: x, y: y, orientation: orientation)
    end
  end

end
