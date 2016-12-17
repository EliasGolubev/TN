class PassengerWagon < Wagon
  TYPE = 'passenger'.freeze

  def initialize(number_of_seats)
    @type = TYPE
    @number_of_seats = number_of_seats
    @number_take_places = 0
    @number_free_places = number_of_seats
  end

  def take_place
    @number_take_places += 1 if empty_place?
    @number_free_places -= 1 if empty_place?
  end

  def empty_place?
    !@number_free_places.zero?
  end

  def take_places
    @number_take_places
  end

  def free_places
    @number_free_places
  end

  private

  attr_accessor :number_take_places, :number_free_places
end
