class Route
  include Validation

  attr_reader :stations, :station

  validate name: 'station', type: 'type'

  def initialize(first, last)
    @stations = [first, last]
    @stations.each do |station|
      @station = station
      validate!(Station)
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
