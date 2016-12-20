class Train
  include Company
  include Validation
  attr_accessor :route
  attr_reader :speed, :type, :number, :wagon

  NUMBER_FORMAT = /^[a-z0-9]{3}-?{1}[a-z0-9]{2}$/i

  DEF_SPEED = 0

  @@trains = {}

  def self.find(number)
    @@trains[number.to_sym]
  end

  validate :name => 'number', :type => 'format'

  def initialize(number)
    @number = number
    @type = get_type
    @wagon = []
    @speed = DEF_SPEED
    @route = nil
    @count = 0
    validate!(NUMBER_FORMAT)
    @@trains[number.to_sym] = self
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

  def wagon_each(&block)
    if block_given?
      @wagon.each_with_index {|wagon, number| yield(wagon, number)}
    else
      @wagon
    end
  end

  protected

  def get_type
  end
end
