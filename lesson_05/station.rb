class Station
  attr_reader :name, :passenger_trains, :cargo_trains
  TYPE = %w(passenger cargo).freeze # create mixin

  @@station_all = []
    
  def self.all 
    @@station_all
  end
  
  def initialize(name)
    @name = name
    @passenger_trains = []
    @cargo_trains = []
    @@station_all << self # debug this
  end

  def add_train(train)
    @passenger_trains << train if train.type == TYPE[0]
    @cargo_trains << train if train.type == TYPE[1] 
  end

  def delete_train(train)
    @passenger_trains.delete(train) if train.type == TYPE[0]
    @cargo_trains.delete(train) if train.type == TYPE[1]
  end

  def show_all(type = nil)
    return @passenger_trains + @cargo_trains if type.nil?
    return @passenger_trains if type == TYPE[0]
    return @cargo_trains if type == TYPE[1]
  end
end
