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
    @station_now = @route.station[@count].name
  end

  def show_station_last
    @station_last = @route.station[@count - 1].name unless @count.zero?
  end

  def show_station_next
    @station_next = @route.station[@count + 1].name if @count != (@route.station.size - 1)
  end

  def route(route)
    @route = route
    @count = 0
    update
  end

  def go_next_station
    if @count != (@route.station.size - 1)
      @count += 1
      update
    end
  end

  def go_last_station
    unless @count.zero?
      @count -= 1
      update
    end
  end

  private

  def update
    show_station_now
    show_station_last
    show_station_next
  end
end
