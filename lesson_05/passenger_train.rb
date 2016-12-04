class PassengerTrain < Train
  TYPE = 'passenger'.freeze
  def add_wagon(wagon)
    super if wagon.type == TYPE
  end

  protected

  def get_type
    TYPE
  end
end
