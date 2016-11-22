class CargoWagon < Wagon
  TYPE = 'cargo'.freeze
  def initialize
    @type = TYPE
  end
end
