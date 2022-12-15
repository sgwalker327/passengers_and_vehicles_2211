require './lib/passenger'
require './lib/vehicle'

RSpec.describe Vehicle do
  before (:each) do
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  it 'exists' do
    expect(@vehicle).to be_an_instance_of(Vehicle)
  end

  it 'has attributes' do
    expect(@vehicle.year).to eq("2001")
    expect(@vehicle.make).to eq("Honda")
    expect(@vehicle.model).to eq("Civic")
  end

  it 'is not speeding be default' do
    expect(@vehicle.speeding?).to be(false)
  end

  it 'vehicle is speeding when speed' do
    @vehicle.speed
    expect(@vehicle.speeding?).to be(true)
  end

  it 'passengers starts as an empty array' do
    expect(@vehicle.passengers).to eq([])
  end

  it 'can add passenger' do
    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@jude)
    @vehicle.add_passenger(@taylor)
    expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])
    # require 'pry'; binding.pry
  end

  it 'can tell the number of adults in a vehicle' do
    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@jude)
    @vehicle.add_passenger(@taylor)

    expect(@vehicle.num_adults).to eq(2)
  end
end