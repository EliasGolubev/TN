class Route
  attr_reader :stations
  def initialize(first, second)
    @stations = [first, second]
  end

  def add(name)
    @stations.insert(@stations.size - 1, name)
  end

  def delete(name)
    @stations.delete(name)
  end

  def show
    @stations.each_with_index { |x, i| puts "#{i}. #{x.name}" }
  end
end
