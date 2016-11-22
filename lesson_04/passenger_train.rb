class PassengerTrain < Train
  TYPE = 'passenger'.freeze
  def add_wagon(wagon)
    super if wagon.type == TYPE
  end

  protected

  # Определение типа поезда
  # Тип Protected потому что класс наследуется
  def get_type
    TYPE
  end
end
