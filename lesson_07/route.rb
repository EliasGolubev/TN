class Route
  attr_reader :stations
  def initialize(first, last)

    @stations = [first, last]
    validate!
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

  def valid?
    validate!
  rescue
    false
  end

  private
  def validate!
    @stations.each do |station|
      raise "Station class: #{station.class} is not Station" if station.class.to_s != "Station"
    end
    true
  end
end
