class Route
  attr_reader :stations
  def initialize(first, second)
    @stations = [first, second]
  end

  def add(name)
    @stations.insert(-2, name)
  end

  def delete(name)
    @stations.delete(name)
  end

  def show
    array = []
    @stations.each_with_index { |x, i| array[i] = x }
    array
  end
end
