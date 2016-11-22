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
helper.menu(1.1)
st_1 = gets.chomp
helper.menu(1.2)
st_end = gets.chomp
station1 = Station.new(st_1)
station_end = Station.new(st_end)
manager = TrainManager.new(station1, station_end)

loop do
  helper.menu(1)
  input = gets.chomp
  case input
  when '1'
    loop do
      helper.menu(2)
      input = gets.chomp
      case input
      when '1'
        helper.menu(2.1)
        train_name = gets.chomp
        train = PassengerTrain.new(train_name)
        manager.add_train(train, station1)
      when '2'
        helper.menu(2.1)
        train_name = gets.chomp
        train = CargoTrain.new(train_name)
        manager.add_train(train, station1)
      when 'h'
        helper.help_add_train
      when 'e'
        break
      end
    end
  when '2'
    loop do
      helper.menu(3)
      input = gets.chomp
      case input
      when '1'
        helper.menu(3.1)
        train_name = gets.chomp
        train = manager.search_passenger_train(train_name)
        manager.delete_train(train)
      when '2'
        helper.menu(3.1)
        train_name = gets.chomp
        train = manager.search_cargo_train(train_name)
        manager.delete_train(train)
      when 'h'
        helper.help_delete_train
      when 'e'
        break
      end
    end
  when '3'
    loop do
      helper.menu(4)
      input = gets.chomp
      case input
      when '1'
        helper.menu(4.1)
        train_name = gets.chomp
        train = manager.search_passenger_train(train_name)
        train.add_wagon(PassengerWagon.new)
      when '2'
        helper.menu(4.2)
        train_name = gets.chomp
        train = manager.search_cargo_train(train_name)
        train.add_wagon(CargoWagon.new)
      when '3'
        helper.menu(4.3)
        train_name = gets.chomp
        train = manager.search_passenger_train(train_name)
        train.delete_wagon
      when '4'
        helper.menu(4.4)
        train_name = gets.chomp
        train = manager.search_cargo_train(train_name)
        train.delete_wagon
      when 'h'
        helper.help_wagon
      when 'e'
        break
      end
    end
  when '4'
    loop do
      helper.menu(5)
      input = gets.chomp
      case input
      when '1'
        helper.menu(5.1)
        train_name = gets.chomp
        train = manager.search_passenger_train(train_name)
        manager.go_train_next(train)
      when '2'
        helper.menu(5.2)
        train_name = gets.chomp
        train = manager.search_cargo_train(train_name)
        manager.go_train_next(train)
      when '3'
        helper.menu(5.1)
        train_name = gets.chomp
        train = manager.search_passenger_train(train_name)
        manager.go_train_last(train)
      when '4'
        helper.menu(5.2)
        train_name = gets.chomp
        train = manager.search_cargo_train(train_name)
        manager.go_train_last(train)
      when 'h'
        helper.help_run_train
      when 'e'
        break
      end
    end
  when '5'
    loop do
      helper.menu(6)
      input = gets.chomp
      case input
      when '1'
        route = manager.route
        route.stations.each do |station|
          puts "Поезда на станции #{station.name}:"
          puts 'Пассажирские:'
          station.show_all('passenger').each { |train| puts train.number }
          puts 'Грузовые:'
          station.show_all('cargo').each { |train| puts train.number }
        end
      when 'h'
        helper.helper_show
      when 'e'
        break
      end
    end
  when '6'
    loop do
      helper.menu(7)
      input = gets.chomp
      case input
      when '1'
        helper.menu(7.1)
        station = gets.chomp
        manager.add_station(Station.new(station))
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
