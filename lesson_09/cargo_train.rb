class CargoTrain < Train
  attr_reader :type
  TYPE = 'cargo'.freeze
  def add_wagon(wagon)
    super if wagon.type == TYPE
  end

  protected

  def type_train
    TYPE
  end
end
