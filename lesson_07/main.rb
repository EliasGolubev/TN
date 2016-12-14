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
  
   CSTR = { con_m: '[Console][Main] Выберите действие(h - Справка): ',
           con_m_fs: '[Console][Main] Введите имя первой станции: ',
           con_m_add_tr: '[Console][Main][Add Train] Выберите действие(h - Справка): ',
           con_m_add_tr_act: '[Console][Main][Add Train] Введите номер поезда: ',
           con_m_del_tr: '[Console][Main][Delete Train] Выберите действие(h - Справка): ',
           con_m_del_tr_act: '[Console][Main][Delete Train] Введите номер поезда:',
           con_m_wagon: '[Console][Main][Wagon] Выберите действие(h - Справка): ',
           con_m_wagon_act: '[Console][Main][Wagon][Add Wagon] Введите номер поезда: ',
           con_m_wagon_tp: '[Console][Main][Wagon][Take Place] Введите объем вагона: ',
           con_m_wagon_fp: '[Console][Main][Wagon][Add Wagon] Введите объем вагона: ',
           con_m_wagon_tv: '[Console][Main][Wagon][Take Volume] Введите объем груза: ',
           con_m_run_tr: '[Console][Main][Run Train] Выберите действие(h - Справка): ',
           con_m_run_tr_act: '[Console][Main][Run Train] Введите номер поезда: ',
           con_m_show_tr: '[Console][Main][Show] Выберите действие(h - Справка): ',
           con_m_show_tr_act: '[Console][Main][Show] Введите номер поезда: ',
           con_m_add_st: '[Console][Main][Add Station] Выберите действие(h - Справка): ',
           con_m_add_st_act: '[Console][Main][Add Station] Введите название станции: ' }.freeze

  HELP_MAIN_MENU = ['[Console][Main] 1 - Создать поезд',
                    '[Console][Main] 2 - Удалить поезд',
                    '[Console][Main] 3 - Добавлять/Отцепить вагоны к поезду',
                    '[Console][Main] 4 - Перемещать поезда',
                    '[Console][Main] 5 - Просматривать список станций и список поездов на станции',
                    '[Console][Main] 6 - Добавлять станции',
                    '[Console][Main] h - Справка',
                    '[Console][Main] e - Выход'].freeze

  HELP_ADD_TRAIN_MENU = ['[Console][Main][Add Train] 1 - Добавить пасажирский поезд',
                         '[Console][Main][Add Train] 2 - Добавить грузовой поезд',
                         '[Console][Main][Add Train] h - Справка',
                         '[Console][Main][Add Train] e - Выход'].freeze

  HELP_DELETE_TRAIN_MENU = ['[Console][Main][Delete Train] 1 - Удалить поезд',
                            '[Console][Main][Delete Train] h - Справка',
                            '[Console][Main][Delete Train] e - Выход'].freeze

  HELP_WAGON_MENU = ['[Console][Main][Wagon] 1 - Добавить вагон',
                     '[Console][Main][Wagon] 2 - Удалить  вагон',
                     '[Console][Main][Wagon] 3 - Занимать место или объем в вагоне',
                     '[Console][Main][Wagon] h - Справка',
                     '[Console][Main][Wagon] e - Выход'].freeze

  HELP_RUN_TRAIN = ['[Console][Main][Run Train] 1 - Перемещение поезда на следующую станцию',
                    '[Console][Main][Run Train] 2 - Перемещение поезда на предыдущую станцию',
                    '[Console][Main][Run Train] h - Справка',
                    '[Console][Main][Run Train] e - Выход'].freeze

  HELP_SHOW = ['[Console][Main][Show] 1 - Выводить список вагонов у поезда',
               '[Console][Main][Show] 2 - Выводить список поездов на станции',
               '[Console][Main][Show] h - Справка',
               '[Console][Main][Show] e - Выход'].freeze

  HELP_ADD_STATION = ['[Console][Main][Add Station] 1 - Добавить станцию',
                      '[Console][Main][Add Station] h - Справка',
                      '[Console][Main][Add Station] e - Выход'].freeze

  CREATE = { con_m_add_pt: '[Console][Main][Add Train] Passenger train created!',
             con_m_add_ct: '[Console][Main][Add Train] Cargo train created!' }.freeze

  ERROR = { con_m_init: '[Console][Main][ERROR] Stations name is not correct!',
            con_m_add: '[Console][Main][Add Train][ERROR] Number has not correct!',
            con_m_add_st: '[Console][Main][Add Station][ERROR] Station name is not correct!' }.freeze
  
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
      free_place = menu_command(TrainManager::CSTR[:con_m_wagon_tp]).to_i
      train.add_wagon(PassengerWagon.new(free_place))
    elsif train.type == 'cargo'
      free_valume = menu_command(TrainManager::CSTR[:con_m_wagon_tp]).to_i
      train.add_wagon(CargoWagon.new(free_valume))
    end
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
      train.wagon_each do |wagon|
        unless wagon.free_places.zero?
          wagon.take_place
          break
        end
      end
    elsif train.type == 'cargo'
      wagon_volume = menu_command(TrainManager::CSTR[:con_m_wagon_tv]).to_i
      train.wagon_each do |wagon|
        if wagon.free_volumes > wagon_volume
          wagon.take_volume(wagon_volume)
          break
        end
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
      puts "[Console][Main][Show] Номер вагона:             #{number + 1}"
      puts "[Console][Main][Show] Тип вагона:               #{wagon.type}"
      puts "[Console][Main][Show] Кол-во свободных мест:    #{wagon.free_places}" if train.type == 'passenger'
      puts "[Console][Main][Show] Кол-во занятых мест:      #{wagon.take_places}" if train.type == 'passenger'
      puts "[Console][Main][Show] Кол-во свободного места:  #{wagon.free_volumes}" if train.type == 'cargo'
      puts "[Console][Main][Show] Кол-во занятого места:    #{wagon.take_volumes}" if train.type == 'cargo'
      puts ''
    end
  end

  def show_station
    station_name = menu_command(TrainManager::CSTR[:con_m_show_tr_act])
    station = give_station(@route, station_name)
    station.train_each do |train|
      puts "[Console][Main][Show] Номер поезда:             #{train.number}"
      puts "[Console][Main][Show] Тип:                      #{train.type}"
      puts "[Console][Main][Show] Кол-во вагонов:           #{train.wagon.size}"
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
