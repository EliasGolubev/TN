class PassengerWagon < Wagon
  TYPE = 'passenger'.freeze
  def initialize
    @type = TYPE
  end
end
