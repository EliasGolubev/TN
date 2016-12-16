require_relative 'mod_company'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

class TrainManager
  CSTR = { con_m: 'Выберите действие(h - Справка): ',
           con_m_fs: 'Введите имя первой станции: ',
           con_m_add_tr: 'Выберите действие(h - Справка): ',
           con_m_add_tr_act: 'Введите номер поезда: ',
           con_m_del_tr: 'Выберите действие(h - Справка): ',
           con_m_del_tr_act: 'Введите номер поезда:',
           con_m_wagon: 'Выберите действие(h - Справка): ',
           con_m_wagon_act: 'Введите номер поезда: ',
           con_m_wagon_tp: 'Введите объем вагона: ',
           con_m_wagon_fp: 'Введите объем вагона: ',
           con_m_wagon_tv: 'Введите объем груза: ',
           con_m_run_tr: 'Выберите действие(h - Справка): ',
           con_m_run_tr_act: 'Введите номер поезда: ',
           con_m_show_tr: 'Выберите действие(h - Справка): ',
           con_m_show_tr_act: 'Введите номер поезда: ',
           con_m_add_st: 'Выберите действие(h - Справка): ',
           con_m_add_st_act: 'Введите название станции: ' }.freeze

  HELP_MAIN_MENU = ['1 - Создать поезд',
                    '2 - Удалить поезд',
                    '3 - Добавлять/Отцепить вагоны к поезду',
                    '4 - Перемещать поезда',
                    '5 - Просматривать список станций/поездов',
                    '6 - Добавлять станции',
                    'h - Справка',
                    'e - Выход'].freeze

  HELP_ADD_TRAIN_MENU = ['1 - Добавить пасажирский поезд',
                         '2 - Добавить грузовой поезд',
                         'h - Справка',
                         'e - Выход'].freeze

  HELP_DELETE_TRAIN_MENU = ['1 - Удалить поезд',
                            'h - Справка',
                            'e - Выход'].freeze

  HELP_WAGON_MENU = ['1 - Добавить вагон',
                     '2 - Удалить  вагон',
                     '3 - Занимать место или объем в вагоне',
                     'h - Справка',
                     'e - Выход'].freeze

  HELP_RUN_TRAIN = ['1 - Перемещение поезда на следующую станцию',
                    '2 - Перемещение поезда на предыдущую станцию',
                    'h - Справка',
                    'e - Выход'].freeze

  HELP_SHOW = ['1 - Выводить список вагонов у поезда',
               '2 - Выводить список поездов на станции',
               'h - Справка',
               'e - Выход'].freeze

  HELP_ADD_STATION = ['1 - Добавить станцию',
                      'h - Справка',
                      'e - Выход'].freeze

  CREATE = { con_m_add_pt: 'Passenger train created!',
             con_m_add_ct: 'Cargo train created!' }.freeze

  ERROR = { con_m_init: 'Stations name is not correct!',
            con_m_add: 'Number has not correct!',
            con_m_add_st: 'Station name is not correct!' }.freeze

  def initialize
    @station_first = station_init
    @station_last = station_init
    @route = Route.new(@station_first, @station_last)
  end

  def run_menu
    loop do
      input = menu_command(TrainManager::CSTR[:con_m])
      case input
      when '1'
        menu_add_train
      when '2'
        menu_delete_train
      when '3'
        menu_wagon
      when '4'
        menu_run
      when '5'
        menu_show
      when '6'
        menu_add_station
      when 'h'
        helper(TrainManager::HELP_MAIN_MENU)
      when 'e'
        break
      end
    end
  end

  private

  attr_accessor :route, :station_first, :station_last

  def station_init
    station_name = menu_command(TrainManager::CSTR[:con_m_fs])
    station = Station.new(station_name)
  rescue
    puts TrainManager::ERROR[:con_m_init]
    retry
  end

  def menu_command(text)
    print text
    gets.chomp
  end

  def helper(string_help)
    string_help.each { |line| puts line }
  end

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

  def menu_add_train
    loop do
      input = menu_command(TrainManager::CSTR[:con_m_add_tr])
      case input
      when '1'
        add_passenger_train
      when '2'
        add_cargo_train
      when 'h'
        helper(TrainManager::HELP_ADD_TRAIN_MENU)
      when 'e'
        break
      end
    end
  end

  def add_passenger_train
    train_name = menu_command(TrainManager::CSTR[:con_m_add_tr_act])
    train = PassengerTrain.new(train_name)
    @station_first.add_train(train)
    train.route = @route
    puts TrainManager::CREATE[:con_m_add_pt]
  rescue
    puts TrainManager::ERROR[:con_m_add]
    retry
  end

  def add_cargo_train
    train_name = menu_command(TrainManager::CSTR[:con_m_add_tr_act])
    train = CargoTrain.new(train_name)
    @station_first.add_train(train)
    train.route = @route
    puts TrainManager::CREATE[:con_m_add_ct]
  rescue
    puts TrainManager::ERROR[:con_m_add]
    retry
  end

  def menu_delete_train
    loop do
      input = menu_command(TrainManager::CSTR[:con_m_del_tr])
      case input
      when '1'
        delete_train
      when 'h'
        helper(TrainManager::HELP_DELETE_TRAIN_MENU)
      when 'e'
        break
      end
    end
  end

  def delete_train
    train_name = menu_command(TrainManager::CSTR[:con_m_del_tr_act])
    train = give_train(@route, train_name)
    train.show_station_now.delete_train(train)
  end

  def menu_wagon
    loop do
      input = menu_command(TrainManager::CSTR[:con_m_wagon])
      case input
      when '1'
        add_wagon
      when '2'
        delete_wagon
      when '3'
        take_volume_wagon
      when 'h'
        helper(TrainManager::HELP_WAGON_MENU)
      when 'e'
        break
      end
    end
  end

  def add_wagon
    train_name = menu_command(TrainManager::CSTR[:con_m_wagon_act])
    train = give_train(@route, train_name)
    if train.type == 'passenger'
      add_passenger_wagon(train)
    elsif train.type == 'cargo'
      add_cargo_wagon(train)
    end
  end

  def add_passenger_wagon(train)
    free_place = menu_command(TrainManager::CSTR[:con_m_wagon_tp]).to_i
    wagon = PassengerWagon.new(free_place)
    train.add_wagon(wagon)
  end

  def add_cargo_wagon(train)
    free_valume = menu_command(TrainManager::CSTR[:con_m_wagon_tp]).to_i
    wagon = CargoWagon.new(free_valume)
    train.add_wagon(wagon)
  end

  def delete_wagon
    train_name = menu_command(TrainManager::CSTR[:con_m_wagon_act])
    train = give_train(@route, train_name)
    train.delete_wagon
  end

  def take_volume_wagon
    train_name = menu_command(TrainManager::CSTR[:con_m_wagon_act])
    train = give_train(@route, train_name)
    if train.type == 'passenger'
      take_passenger_volume
    elsif train.type == 'cargo'
      take_cargo_volume
    end
  end

  def take_passenger_volume
    train.wagon_each do |wagon|
      unless wagon.free_places.zero?
        wagon.take_place
        break
      end
    end
  end

  def take_cargo_volume
    wagon_volume = menu_command(TrainManager::CSTR[:con_m_wagon_tv]).to_i
    train.wagon_each do |wagon|
      if wagon.free_volumes > wagon_volume
        wagon.take_volume(wagon_volume)
        break
      end
    end
  end

  def menu_run
    loop do
      input = menu_command(TrainManager::CSTR[:con_m_run_tr])
      case input
      when '1'
        run_train_next_station
      when '2'
        run_train_last_station
      when 'h'
        helper(TrainManager::HELP_RUN_TRAIN)
      when 'e'
        break
      end
    end
  end

  def run_train_next_station
    train_name = menu_command(TrainManager::CSTR[:con_m_run_tr_act])
    train = give_train(@route, train_name)
    train.show_station_now.delete_train(train)
    train.go_next_station
    train.show_station_now.add_train(train)
  end

  def run_train_last_station
    train_name = menu_command(TrainManager::CSTR[:con_m_run_tr])
    train = give_train(@route, train_name)
    train.show_station_now.delete_train(train)
    train.go_last_station
    train.show_station_now.add_train(train)
  end

  def menu_show
    loop do
      input = menu_command(TrainManager::CSTR[:con_m_show_tr])
      case input
      when '1'
        show_train
      when '2'
        show_station
      when 'h'
        helper(TrainManager::HELP_SHOW)
      when 'e'
        break
      end
    end
  end

  def show_train
    train_name = menu_command(TrainManager::CSTR[:con_m_show_tr_act])
    train = give_train(@route, train_name)
    train.wagon_each do |wagon, number|
      puts "Номер вагона:        #{number + 1}"
      puts "Тип вагона:          #{wagon.type}"
      puts "Кол-во св-ых мест:   #{wagon.free_places}" if train.type == 'passenger'
      puts "Кол-во зан-ых мест:  #{wagon.take_places}" if train.type == 'passenger'
      puts "Кол-во св-ого места: #{wagon.free_volumes}" if train.type == 'cargo'
      puts "Кол-во зан-ого места:#{wagon.take_volumes}" if train.type == 'cargo'
    end
  end

  def show_station
    station_name = menu_command(TrainManager::CSTR[:con_m_show_tr_act])
    station = give_station(@route, station_name)
    station.train_each do |train|
      puts "Номер поезда:      #{train.number}"
      puts "Тип:               #{train.type}"
      puts "Кол-во вагонов:    #{train.wagon.size}"
      puts ''
    end
  end

  def menu_add_station
    loop do
      input = menu_command(TrainManager::CSTR[:con_m_add_st])
      case input
      when '1'
        add_station
      when 'h'
        helper(TrainManager::HELP_ADD_STATION)
      when 'e'
        break
      end
    end
  end

  def add_station
    station_name = menu_command(TrainManager::CSTR[:con_m_add_st_act])
    route.add(Station.new(station_name))
    array_station = @route.show
    array_station.each do |station|
      station.passenger_trains.each do |train|
        train.route = @route
      end
    end
  rescue
    puts TrainManager::ERROR[:con_m_add_st]
  end
end

tm = TrainManager.new
tm.run_menu
