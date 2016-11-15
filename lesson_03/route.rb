class Route
  def initialize(first, second)
    @station = [first, second]
  end
  
  def add(name)
    temp = @station.slice!(@station.size - 1)
    @station << name << temp
  end
  
  def add(name, number=@station.size-1)
    temp = @station.slice!(number..@station.size-1)
    @station << name
    @station += temp
  end
  
  def delete(name)
    @station.delete(name)
  end    
  
  def show
    return @station
  end  
end