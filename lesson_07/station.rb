class Station
  attr_reader :name, :passenger_trains, :cargo_trains
  TYPE = %w(passenger cargo).freeze 

  NAME_FORMAT = /^[A-Z]{1}[a-z]*$/

  @@station_all = []
    
  def self.all 
    @@station_all
  end
  
  def initialize(name)
    @name = name
    validate!
    @trains = []
    @passenger_trains = []
    @cargo_trains = []
    @@station_all << self
  end

  def add_train(train)
    @trains << train
    update(train) 
  end

  def delete_train(train)
    @trains.delete(train)
    update_del(train)
  end

  def show_all(type = nil)
    return @trains if type.nil?
    return @passenger_trains if type == TYPE[0]
    return @cargo_trains if type == TYPE[1]
  end

  # написать метод, который принимает блок и проходит по всем поездам на станции, 
  # передавая каждый поезд в блок.
  def train_each(&block)
    if block_given?
      @trains.each {|train| yield(train)}
    else
      @trains
    end
  end

  def valid?
    validate!
  rescue
    false
  end

  private

  def validate!
    raise "Station name has not format" if name !~ NAME_FORMAT
    true
  end

  def update(train)
    @passenger_trains << train if train.type == TYPE[0]
    @cargo_trains << train if train.type == TYPE[1]
  end

  def update_del(train)
    @passenger_trains.delete(train) if train.type == TYPE[0]
    @cargo_trains.delete(train) if train.type == TYPE[1]
  end
end
