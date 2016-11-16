class Route
  attr_reader :station
  def initialize(first, second)
    @station = [first, second]
  end

  def add(name, number = @station.size - 1)
    temp = @station.slice!(number..@station.size - 1)
    @station << name
    @station += temp
  end

  def delete(name)
    @station.delete(name)
  end

  def show
    @station.each_with_index { |x, i| puts "#{i}. #{x.name}" }
  end
end
