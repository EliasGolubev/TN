class TrainManager
  attr_reader :route, :station1, :station_end
  def initialize(station1, station_end)
    @station1 = station1
    @station_end = station_end
    @route = Route.new(@station1, @station_end)
  end

  def add_station(station)
    @route.add(station)
  end

  def add_train(train, station)
    station.add_train(train)
    train.route = @route
  end

  def delete_train(train)
    @route.show.each do |_key, value|
      value.delete_train(train) if value.passenger_trains.include?(train)
    end
  end

  def search_passenger_train(name)
    @route.show.each do |_key, value|
      value.show_all('passenger').each do |train|
        return train if train.number == name
      end
    end
  end

  def search_cargo_train(name)
    @route.show.each do |_key, value|
      value.show_all('cargo').each do |train|
        return train if train.number == name
      end
    end
  end

  def go_train_next(train)
    train.speed_up
    station_now = train.go_next_station
    delete_train(train)
    train.speed_down
    add_train(train, @route.stations[station_now])
  end

  def go_train_last(train)
    train.speed_up
    station_now = train.go_last_station
    delete_train(train)
    train.speed_down
    add_train(train, @route.stations[station_now])
  end
end
