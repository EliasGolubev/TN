class CargoWagon < Wagon
  TYPE = 'cargo'.freeze
  def initialize(wagon_volume)
    @type = TYPE
    @wagon_volume = wagon_volume
    @free_wagon_volume = @wagon_volume
    @take_wagon_volume = 0
  end

  def take_volume(wagon_volume)
    if wagon_volume < @free_wagon_volume
      @free_wagon_volume -= wagon_volume
      @take_wagon_volume += wagon_volume
    else
      puts 'Wagon volume > Free volume'
    end
  end

  def take_volumes
    @take_wagon_volume
  end

  def free_volumes
    @free_wagon_volume
  end

  private

  attr_accessor :take_wagon_volume, :free_wagon_volume
end
