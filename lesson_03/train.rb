module PassengerPar
  TYPE = "passenger"
  DEF_SPEED = 0
end

module FreightPar
  TYPE = "freight"
  DEF_SPEED = 0
end

class PassengerType
  attr_reader :speed, :type
  attr_accessor :wagon
  
  def initialize(number, wagon)
    @number = number
    @wagon = wagon
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
  attr_reader :speed, :type
  attr_accessor :wagon
  
  def initialize(number, wagon)
    @number = number
    @wagon = wagon
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

class Train
  def initialize(train)
    @train = train
    @route = nil
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
    return @train.wagon
  end
  
  def add_wagon
    @train.wagon += 1 if @train.speed.zero?
  end
  
  def delete_wagon
    @train.wagon -= 1 if @train.speed.zero?
  end
  
  def station_now
    @station_now = @route[@count]
  end
  
  def station_last 
    @station_last = @route[@count - 1] if @count != 0
  end
  
  def station_next
    @station_next = @route[@count + 1] if @count != @route.size
  end
  
  def route(route)
    @route = route.show
    @count = 0
    self.station_now
  end
  
  def next_station
    @count += 1
  end
  
  def last_station
    @count -= 1 if !@count.zero?
  end
    
end

