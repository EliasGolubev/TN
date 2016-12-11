class CargoWagon < Wagon
  TYPE = 'cargo'.freeze
  # Добавить атрибут общего объема (задается при создании вагона)
  def initialize(wagon_volume)
    @type = TYPE
    @wagon_volume = wagon_volume
    @free_wagon_volume = @wagon_volume
    @take_wagon_volume = 0
  end
  # Добавить метод, которые "занимает объем" в вагоне
  def take_volume(wagon_volume)
    if wagon_volume < @free_wagon_volume
      @free_wagon_volume -= wagon_volume
      @take_wagon_volume += wagon_volume
    else
      puts "Wagon volume > Free volume"
    end
  end
  # Добавить метод, который возвращает занятый объем
  def take_volumes
    @take_wagon_volume
  end
  # Добавить метод, который возвращает оставшийся (доступный) объем
  def free_volumes
    @free_wagon_volume
  end

  private
  
  attr_accessor :take_wagon_volume, :free_wagon_volume

end
