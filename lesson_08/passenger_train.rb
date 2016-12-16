class PassengerTrain < Train
  TYPE = 'passenger'.freeze
  def add_wagon(wagon)
    super if wagon.type == TYPE
  end

  protected

  def type_train
    TYPE
  end
end
