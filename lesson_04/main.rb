require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'train_manager'
require_relative 'helper'

helper = Helper.new

# Create first station
helper.menu(1.1)
station_first = Station.new(gets.chomp)

# Create last station
helper.menu(1.2)
station_last = Station.new(gets.chomp)

# Create Route
route = Route.new(station_first, station_last)

# Main menu
loop do
  helper.menu(1)
  input = gets.chomp
  case input
  when '1'
    # Menu create train
    loop do 
      helper.menu(2)
      input = gets.chomp
      case input
      when '1'-
        # Add passenger train
        helper.menu(2.1)
        train_name = gets.chomp
        train = PassengerTrain.new(train_name)
        station_first.add_train(train)
        train.route = route
      when '2'
        # Add cargo train
        helper.menu(2.1)
        train_name = gets.chomp
        train = CargoTrain.new(train_name)
        station_first.add_train(train)
        train.route = route
      when 'h'
        helper.help_add_train
      when 'e'
        break
      end
    end
  when '2'
    # Menu Delete train
    loop do
      helper.menu(3)
      input = gets.chomp
      case input
      when '1'
        # Delete passenger train
        helper.menu(3.1)
        train_name = gets.chomp
        train = helper.give_train(route, train_name)
        train.show_station_now.delete_train(train)
      when 'h'
        helper.help_delete_train
      when 'e'
        break
      end
    end
  when '3'
    # Menu Add wagon
    loop do
      helper.menu(4)
      input = gets.chomp
      case input
      when '1'
        # Add Passenger or Cargo Wagon
        helper.menu(4.1)
        train_name = gets.chomp
        train = helpe-r.give_train(route, train_name)
        if train.type == 'passenger'
          train.add_wagon(PassengerWagon.new)
        elsif train.type == 'cargo'
          train.add_wagon(CargoWagon.new)
        end
      when '2'
        # Delete Passenger or Cargo Wagon
        helper.menu(4.1)
        train_name = gets.chomp
        train = helper.give_train(route, train_name)
        train.delete_wagon
      when 'h'
        helper.help_wagon
      when 'e'
        break
      end
    end
  when '4'
    # Menu Go Train
    loop do
      helper.menu(5)
      input = gets.chomp
      case input 
      when '1'
        # Go Passenger Train next station
        helper.menu(5.1)
        train_name = gets.chomp
        train = helper.give_train(route, train_name)
        train.show_st-ation_now.delete_train(train)
        train.go_next_station
        train.show_station_now.add_train(train)
      when '2'
        # Go Passenger Train or Cargo Train last station
        helper.menu(5.1)
        train_name = gets.chomp
        train = helper.give_train(route, train_name)
        train.show_station_now.delete_train(train)
        train.go_last_station
        train.show_station_now.add_train(train)
      when 'h'
        helper.help_run_train
      when 'e'
        break
      end
    end
  when '5'
    # Menu Show train
    loop do
      helper.menu(6)
      input = gets.chomp
      case input
      when '1'
        # Show all Station and All Train
        array_station = route.show
        array_station.each do |station|
          print "Станция: "
          puts station.name

          puts 'Пассажирские поезда'
          station.passenger_trains.each do |train|
            puts train.number
          end

          puts 'Грузовые поезда'
          station.cargo_trains.each do |train|
            puts train.number
          end
        end
      when 'h'
        helper.helper_show
      when 'e'
        break
      end
    end
  when '6'
    # Menu Add Station
    loop do 
      helper.menu(7)
      input = gets.chomp
      case input
      when '1'
        # Add Station
        helper.menu(7.1)
        station_name = gets.chomp
        route.add(Station.new(station_name))
        array_station = route.show
        array_station.each do |station|
          station.passenger_trains.each do |train|
            train.route = route
          end
        end
      when 'h'
        helper.helper_add_station
      when 'e'
        break
      end
    end
  when 'h'
    helper.help_main
  when 'e'
    break
  end
end
