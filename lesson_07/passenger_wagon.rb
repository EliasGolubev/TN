class PassengerWagon < Wagon
  TYPE = 'passenger'.freeze
  # Добавить атрибут общего кол-ва мест (задается при создании вагона)
  def initialize(number_of_seats)
    @type = TYPE
    @number_of_seats = number_of_seats
    @number_take_places = 0
    @number_free_places = number_of_seats
  end
  # Добавить метод, который "занимает места" в вагоне (по одному за раз)
  def take_place
    unless @number_free_places.zero?
      @number_take_places += 1
      @number_free_places -= 1
    end
  end
  # Добавить метод, который возвращает кол-во занятых мест в вагоне
  def take_places
    @number_take_places
  end
  # Добавить метод, возвращающий кол-во свободных мест в вагоне.
  def free_places
    @number_free_places
  end

  private
  
  attr_accessor :number_take_places, :number_free_places

end
