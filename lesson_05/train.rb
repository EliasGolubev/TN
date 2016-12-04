class Train
  include Company

  attr_accessor :route
  attr_reader :speed, :type, :number

  DEF_SPEED = 0

  @@trains = []

  def self.find(number)
    ret_train = 0
    @@trains.each {|train| ret_train = train if train.number == number}
    ret_train == 0 ?  nil : ret_train
  end

  def initialize(number)
    @number = number
    @type = get_type
    @wagon = []
    @speed = DEF_SPEED
    @route = nil
    @count = 0
    @@trains << self
  end

  def add_wagon(wagon)
    @wagon << wagon if @speed.zero?
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
    @route.stations[@count]
  end

  def show_station_last
    @route.stations[@count - 1] unless @count.zero?
  end

  def show_station_next
    @route.stations[@count + 1] if @count != (@route.stations.size - 1)
  end

  def go_next_station
    @count += 1 if @count != (@route.stations.size - 1)
  end

  def go_last_station
    @count -= 1 unless @count.zero?
  end

  protected

  def get_type
  end
end
