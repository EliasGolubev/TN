class CargoTrain < Train
  attr_reader :type
  TYPE = 'cargo'.freeze
  def add_wagon(wagon)
    super if wagon.type == TYPE
  end

  protected

  def get_type
    TYPE
  end
end
