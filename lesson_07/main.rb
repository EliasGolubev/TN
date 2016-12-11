require_relative 'mod_company'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'


def give_train(route, number)
  route.stations.each do |station|
    station.show_all.each do |train|
      return train if train.number == number
    end
  end
end

def give_station(route, name)
  route.stations.each do |station|
    return station if station.name == name
  end
end

begin
  print "[Console][Main] Введите имя первой станции: "
  station_first = Station.new(gets.chomp)
rescue
  puts "[Console][Main][ERROR] Stations name is not correct!"
  retry
end

begin 
  print "[Console][Main] Введите имя последней станции: "
  station_last = Station.new(gets.chomp)
rescue
  puts "[Console][Main][ERROR] Station name is not correct!"
  retry
end

route = Route.new(station_first, station_last)

loop do
  print "[Console][Main] Выберите действие(h - Справка): "
  input = gets.chomp
  case input
  when '1'
    loop do 
      print "[Console][Main][Add Train] Выберите действие(h - Справка): "
      input = gets.chomp
      case input
      when '1'
        begin
          print "[Console][Main][Add Train] Введите номер поезда: "
          train_name = gets.chomp
          train = PassengerTrain.new(train_name)
          station_first.add_train(train)
          train.route = route
          puts "[Console][Main][Add Train] Passenger train created!"
        rescue
          puts "[Console][Main][Add Train][ERROR] Number has not correct!"
          retry
        end
      when '2'
        begin
          print "[Console][Main][Add Train] Введите номер поезда: "
          train_name = gets.chomp
          train = CargoTrain.new(train_name)
          station_first.add_train(train)
          train.route = route
          puts "[Console][Main][Add Train] Cargo train created!"
        rescue
          puts "[Console][Main][Add Train][ERROR] Number has not correct!"
          retry
        end
      when 'h'
        puts "[Console][Main][Add Train] 1 - Добавить пасажирский поезд"
        puts "[Console][Main][Add Train] 2 - Добавить грузовой поезд"
        puts "[Console][Main][Add Train] h - Справка"
        puts "[Console][Main][Add Train] e - Выход"
      when 'e'
        break
      end
    end
  when '2'
    loop do
      print "[Console][Main][Delete Train] Выберите действие(h - Справка): "
      input = gets.chomp
      case input
      when '1'
        print "[Console][Main][Delete Train] Введите номер поезда:"
        train_name = gets.chomp
        train = give_train(route, train_name)
        train.show_station_now.delete_train(train)
      when 'h' 
        puts "[Console][Main][Delete Train] 1 - Удалить поезд"
        puts "[Console][Main][Delete Train] h - Справка"
        puts "[Console][Main][Delete Train] e - Выход"
      when 'e'
        break
      end
    end
  when '3'
    loop do
      print "[Console][Main][Wagon] Выберите действие(h - Справка): "
      input = gets.chomp
      case input
      when '1'
        # При создании вагона указывать кол-во мест или общий объем, в зависимости от типа вагона
        print "[Console][Main][Wagon][Add Wagon] Введите номер поезда: "
        train_name = gets.chomp
        train = give_train(route, train_name)
        if train.type == 'passenger'
          print "[Console][Main][Wagon][Add Wagon] Введите количество свободных мест в вагоне: "
          free_place = gets.to_i
          train.add_wagon(PassengerWagon.new(free_place))
        elsif train.type == 'cargo'
          print "[Console][Main][Wagon][Add Wagon] Введите объем вагона: "
          free_valume = gets.to_i
          train.add_wagon(CargoWagon.new(free_valume))
        end
      when '2'
        print "[Console][Main][Wagon][Delete Wagon] Введите номер поезда: "
        train_name = gets.chomp
        train = give_train(route, train_name)
        train.delete_wagon
      when '3'
        # Занимать место или объем в вагоне
        print "[Console][Main][Wagon][Take Place] Введите номер поезда: "
        train_name = gets.chomp
        train = give_train(route, train_name)
        if train.type == 'passenger'  
          train.wagon_each do |wagon| 
            unless wagon.free_places.zero?
              wagon.take_place
              break
            end
          end
        elsif train.type == 'cargo'
          print "[Console][Main][Wagon][Take Volume] Введите объем груза: "
          wagon_volume = gets.to_i
          train.wagon_each do |wagon|
            if wagon.free_volumes > wagon_volume
              wagon.take_volume(wagon_volume)
              break
            end
          end 
        end
      when 'h'
        puts "[Console][Main][Wagon] 1 - Добавить вагон"
        puts "[Console][Main][Wagon] 2 - Удалить  вагон"
        puts "[Console][Main][Wagon] 3 - Занимать место или объем в вагоне"
        puts "[Console][Main][Wagon] h - Справка"
        puts "[Console][Main][Wagon] e - Выход"
      when 'e'
        break
      end
    end
  when '4'
    loop do
      print "[Console][Main][Run Train] Выберите действие(h - Справка): "
      input = gets.chomp
      case input 
      when '1'
        print "[Console][Main][Run Train] Введите номер поезда: "
        train_name = gets.chomp
        train = give_train(route, train_name)
        train.show_st-ation_now.delete_train(train)
        train.go_next_station
        train.show_station_now.add_train(train)
      when '2'
        print "[Console][Main][Run Train] Введите номер поезда: "
        train_name = gets.chomp
        train = give_train(route, train_name)
        train.show_station_now.delete_train(train)
        train.go_last_station
        train.show_station_now.add_train(train)
      when 'h'
        puts "[Console][Main][Run Train] 1 - Перемещение поезда на следующую станцию"
        puts "[Console][Main][Run Train] 2 - Перемещение поезда на предыдущую станцию"
        puts "[Console][Main][Run Train] h - Справка"
        puts "[Console][Main][Run Train] e - Выход"
      when 'e'
        break
      end
    end
  when '5'
    loop do
      print "[Console][Main][Show] Выберите действие(h - Справка): "
      input = gets.chomp
      case input
      when '1'
        # Выводить список вагонов у поезда (в  формате)
        # Номер вагона (можно назначать автоматически), 
        # тип вагона, 
        # кол-во свободных и занятых мест (для пассажирского вагона) 
        # или кол-во свободного и занятого объема (для грузовых вагонов).
        print "[Console][Main][Show] Введите номер поезда: "
        train_name = gets.chomp
        train = give_train(route, train_name)
        train.wagon_each do |wagon, number|
          puts "------------------------------------------------------------------"
          puts "[Console][Main][Show] Номер вагона:             #{number + 1}"
          puts "[Console][Main][Show] Тип вагона:               #{wagon.type}"
          puts "[Console][Main][Show] Кол-во свободных мест:    #{wagon.free_places}" if train.type == 'passenger'
          puts "[Console][Main][Show] Кол-во занятых мест:      #{wagon.take_places}" if train.type == 'passenger'
          puts "[Console][Main][Show] Кол-во свободного места:  #{wagon.free_volumes}" if train.type == 'cargo'
          puts "[Console][Main][Show] Кол-во занятого места:    #{wagon.take_volumes}" if train.type == 'cargo'
          puts ""
        end
      when '2'
        # Выводить список поездов на станции (в формате)
        # Номер поезда, тип, кол-во вагонов
        print "[Console][Main][Show] Введите имя станции: "
        station_name = gets.chomp
        station = give_station(route, station_name)
        station.train_each do |train|
          puts "------------------------------------------------------------------"
          puts "[Console][Main][Show] Номер поезда:             #{train.number}"
          puts "[Console][Main][Show] Тип:                      #{train.type}"
          puts "[Console][Main][Show] Кол-во вагонов:           #{train.wagon.size}"
          puts ""
        end

      when 'h'
        puts "[Console][Main][Show] 1 - Выводить список вагонов у поезда"
        puts "[Console][Main][Show] 2 - Выводить список поездов на станции"
        puts "[Console][Main][Show] h - Справка"
        puts "[Console][Main][Show] e - Выход"
      when 'e'
        break
      end
    end
  when '6'
    loop do 
      print "[Console][Main][Add Station] Выберите действие(h - Справка): "
      input = gets.chomp
      case input
      when '1'
        begin
          print "[Console][Main][Add Station] Введите название станции: "
          station_name = gets.chomp
          route.add(Station.new(station_name))
          array_station = route.show
          array_station.each do |station|
            station.passenger_trains.each do |train|
              train.route = route
            end
          end
          rescue
            puts "[Console][Main][Add Station][ERROR] Station name is not correct!"
        end

      when 'h'
        puts "[Console][Main][Add Station] 1 - Добавить станцию"
        puts "[Console][Main][Add Station] h - Справка"
        puts "[Console][Main][Add Station] e - Выход"
      when 'e'
        break
      end
    end
  when 'h'
    puts "[Console][Main] 1 - Создать поезд"
    puts "[Console][Main] 2 - Удалить поезд"
    puts "[Console][Main] 3 - Добавлять/Отцепить вагоны к поезду"
    puts "[Console][Main] 4 - Перемещать поезда"
    puts "[Console][Main] 5 - Просматривать список станций и список поездов на станции"
    puts "[Console][Main] 6 - Добавлять станции"
    puts "[Console][Main] h - Справка"
    puts "[Console][Main] e - Выход"
  when 'e'
    break
  end
end
