class Train
  attr_reader :speed, :wagon, :type

  TYPE = %w(passenger freight).freeze
  DEF_SPEED = 0

  def initialize(number, type, wagon)
    @number = number
    @type = type
    @wagon = wagon
    @speed = DEF_SPEED
    @route = nil
    @count = 0
  end

  def speed_up
    @speed += 10
  end

  def speed_down
    @speed -= 5 if @speed > DEF_SPEED
  end

  def add_wagon
    @wagon += 1 if @speed.zero?
  end

  def delete_wagon
    if @speed.zero?
      @wagon -= 1 if @wagon > 0
    end
  end

  def show_station_now
    return @route.stations[@count].name
  end

  def show_station_last
    return @route.stations[@count - 1].name unless @count.zero?
  end

  def show_station_next
    return @route.stations[@count + 1].name if @count != (@route.stations.size - 1)
  end

  def route(route)
    @route = route
  end

  def go_next_station
      @count += 1 if @count != (@route.stations.size - 1)
  end

  def go_last_station
      @count -= 1 unless @count.zero?
  end
end
