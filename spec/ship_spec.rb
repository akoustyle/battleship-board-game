# frozen_string_literal: true

require_relative '../models/ship'

RSpec.describe 'Ship' do
  it 'return an instance of Ship' do
    ship = Ship.new(type: 'type', length: 3, x: 1, y: 1, orientation: 'horizontal')
    expect(ship.class).to eq(Ship)
  end

  it 'should initialize the ships points' do
    ship = Ship.new(type: 'type', length: 3, x: 1, y: 1, orientation: 'horizontal')

    expect(ship.initialize_ship_points).to be_a Integer
  end
end
