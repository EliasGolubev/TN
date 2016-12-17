class Route
  include Validation

  attr_reader :stations
  def initialize(first, last)
    @stations = [first, last]
    @stations.each do |station|
      validate!(:name => station)
      validate!(:number => station, :type => 'Station')
    end
  end

  def add(station)
    @stations.insert(-2, station)
  end

  def delete(station)
    @stations.delete(station)
  end

  def show
    array = []
    @stations.each_with_index { |station, index| array[index] = station }
    array
  end
end
