class Station
  attr_reader :name
  
  def initialize(name)
    @name = name
    @passenger_trains = []
    @freight_trains = []
  end
  
  def add_train(train)
    @passenger_trains << train if train.type == "passenger"
    @freight_trains << train if train.type == "freight"
  end
  
  def delete_train(train)
    @passenger_trains.delete(train) if train.type.equal?("passenger")
    @freight_trains.delete(train) if train.type.equal?("freight")
  end
  
  def show_all()
    return @passenger_trains + @freight_trains
  end
  
  def show_all(type)
    return @passenger_trains if @train.type.equal?("passenger")
    return @freight_trains if @train.type.equal?("freight")
  end
end