class Station
  include Validation
  attr_reader :name, :passenger_trains, :cargo_trains
  TYPE = %w(passenger cargo).freeze

  NAME_FORMAT = /^[A-Z]{1}[a-z]*$/

  @@stations_all = []

  def self.all
    @@stations_all
  end

  validate :name, :format, NAME_FORMAT 

  def initialize(name)
    @name = name
    validate!
    @passenger_trains = []
    @cargo_trains = []
    @@stations_all << self
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

  def train_each
    if block_given?
      @trains.each { |train| yield(train) }
    else
      @trains
    end
  end

  private

  def update(train)
    @passenger_trains << train if train.type == TYPE[0]
    @cargo_trains << train if train.type == TYPE[1]
  end

  def update_del(train)
    @passenger_trains.delete(train) if train.type == TYPE[0]
    @cargo_trains.delete(train) if train.type == TYPE[1]
  end
end
