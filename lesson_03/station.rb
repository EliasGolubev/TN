class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @passenger_trains = []
    @freight_trains = []
  end

  def add_train(train)
    @passenger_trains << train if train.type == Train::TYPE[0]
    @freight_trains << train if train.type == Train::TYPE[1]
  end

  def delete_train(train)
    @passenger_trains.delete(train) if train.type == Train::TYPE[0]
    @freight_trains.delete(train) if train.type == Train::TYPE[1]
  end

  def show_all(type = nil)
    return @passenger_trains + @freight_trains if type.nil?
    return @passenger_trains if type == Train::TYPE[0]
    return @freight_trains if type == Train::TYPE[1]
  end
end
