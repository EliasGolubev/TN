class Train
  DEF_SPEED = 0
  attr_accessor :route
  attr_reader :speed, :type, :number
  def initialize(number)
    @number = number
    @type = get_type
    @wagon = []
    @speed = DEF_SPEED
    @route = nil
    @count = 0
  end

  def add_wagon(wagon)
    @wagon.push(wagon)
  end

  def delete_wagon
    if @speed.zero?
      @wagon.pop unless @wagon.empty?
    end
  end

  def speed_up
    @speed += 10
  end

  def speed_down
    @speed -= 5 if @speed > DEF_SPEED
  end

  def show_station_now
    @route.stations[@count].name
  end

  def show_station_last
    @route.stations[@count - 1].name unless @count.zero?
  end

  def show_station_next
    @route.stations[@count + 1].name if @count != (@route.stations.size - 1)
  end

  def go_next_station
    @count += 1 if @count != (@route.stations.size - 1)
  end

  def go_last_station
    @count -= 1 unless @count.zero?
  end

  protected

  # Тип для инициализации типа поезда
  # Тип Protected потому что класс наследуется
  def get_type
  end
end
