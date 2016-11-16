module PassengerPar
  TYPE = 'passenger'.freeze
  DEF_SPEED = 0
end

module FreightPar
  TYPE = 'freight'.freeze
  DEF_SPEED = 0
end

class Train
  def initialize(train, wagon)
    @train = train
    @wagon = wagon
    @route = nil
  end

  def number
    @train.number
  end

  def type
    @train.type
  end

  def speed_up
    @train.speed_up
  end

  def speed_down
    @train.speed_down
  end

  def speed_now
    @train.speed
  end

  def show_wagon
    @wagon
  end

  def add_wagon
    @wagon += 1 if @train.speed.zero?
  end

  def delete_wagon
    if @train.speed.zero?
      @wagon -= 1 if @wagon > 0
    end
  end

  def station_now
    @station_now = @route.station[@count].name
  end

  def station_last
    @station_last = @route.station[@count - 1].name unless @count.zero?
  end

  def station_next
    @station_next = @route.station[@count + 1].name if @count != (@route.station.size - 1)
  end

  def route(route)
    @route = route
    @count = 0
    update
  end

  def next_station
    if @count != (@route.station.size - 1)
      @count += 1
      update
    end
  end

  def last_station
    unless @count.zero?
      @count -= 1
      update
    end
  end

  private

  def update
    station_now
    station_last
    station_next
  end
end

class PassengerType
  attr_reader :speed, :type, :number

  def initialize(number)
    @number = number
    @type = PassengerPar::TYPE
    @speed = PassengerPar::DEF_SPEED
  end

  def speed_up
    @speed += 10
  end

  def speed_down
    @speed -= 10 if @speed > PassengerPar::DEF_SPEED
  end
end

class FreightType
  attr_reader :speed, :type, :number

  def initialize(number)
    @number = number
    @type = FreightPar::TYPE
    @speed = FreightPar::DEF_SPEED
  end

  def speed_up
    @speed += 5
  end

  def speed_down
    @speed -= 5 if @speed > FreightPar::DEF_SPEED
  end
end
