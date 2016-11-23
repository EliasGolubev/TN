require 'colorize'

private

class Helper
  MENU_GREEN = ['[Console]'.colorize(:green),
                '[Main]'.colorize(:green),
                '[Add Train]'.colorize(:green),
                '[Delete Train]'.colorize(:green),
                '[Wagon]'.colorize(:green),
                '[Run Train]'.colorize(:green),
                '[Show]'.colorize(:green)].freeze

  MENU_YELLOW = ['[Console]'.colorize(:yellow),
                 '[Main]'.colorize(:yellow),
                 '[Add Train]'.colorize(:yellow),
                 '[Delete Train]'.colorize(:yellow),
                 '[Wagon]'.colorize(:yellow),
                 '[Run Train]'.colorize(:yellow),
                 '[Show]'.colorize(:yellow),
                 '[Add Passeger Wagon]'.colorize(:yellow),
                 '[Add Station]'.colorize(:yellow),
                 '[Add Cargo Wagon]'.colorize(:yellow),
                 '[Delete Passenger Wagon]'.colorize(:yellow),
                 '[Delete Crgo Wagon]'.colorize(:yellow),
                 '[Run Passeger Train]'.colorize(:yellow),
                 '[Run Cargo Train]'.colorize(:yellow)].freeze

  def menu(level)
    case level
    when 1
      print "#{MENU_GREEN[0]}#{MENU_YELLOW[1]} Выберите действие(h - Справка): "
    when 1.1
      print "#{MENU_GREEN[0]}#{MENU_YELLOW[1]} Введите имя первой станции: "
    when 1.2
      print "#{MENU_GREEN[0]}#{MENU_YELLOW[1]} Введите имя последней станции: "
    when 2
      print "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[2]} Выберите действие(h - Справка): "
    when 2.1
      print "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[2]} Введите номер поезда:"
    when 3
      print "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[3]} Выберите действие(h - Справка): "
    when 3.1
      print "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[3]} Введите номер поезда:"
    when 4
      print "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[4]} Выберите действие(h - Справка): "
    when 4.1
      print "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_GREEN[4]}#{MENU_YELLOW[7]} Введите номер поезда: "
    when 4.2
      print "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_GREEN[4]}#{MENU_YELLOW[9]} Введите номер поезда: "
    when 4.3
      print "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_GREEN[4]}#{MENU_YELLOW[10]} Введите номер поезда: "
    when 4.4
      print "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_GREEN[4]}#{MENU_YELLOW[11]} Введите номер поезда: "
    when 5
      print "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[5]} Выберите действие(h - Справка): "
    when 5.1
      print "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_GREEN[5]}#{MENU_YELLOW[12]} Выберите действие(h - Справка): "
    when 5.2
      print "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_GREEN[5]}#{MENU_YELLOW[13]} Выберите действие(h - Справка): "
    when 6
      print "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[6]} Выберите действие(h - Справка): "
    when 7
      print "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[8]} Выберите действие(h - Справка): "
    when 7.1
      print "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[8]} Введите название станции: "
    end
  end

  def help_main
    puts "#{MENU_GREEN[0]}#{MENU_YELLOW[1]} 1 - Создать поезд"
    puts "#{MENU_GREEN[0]}#{MENU_YELLOW[1]} 2 - Удалить поезд"
    puts "#{MENU_GREEN[0]}#{MENU_YELLOW[1]} 3 - Добавлять/Отцепить вагоны к поезду"
    puts "#{MENU_GREEN[0]}#{MENU_YELLOW[1]} 4 - Перемещать поезда"
    puts "#{MENU_GREEN[0]}#{MENU_YELLOW[1]} 5 - Просматривать список станций и список поездов на станции"
    puts "#{MENU_GREEN[0]}#{MENU_YELLOW[1]} 6 - Добавлять станции"
    puts "#{MENU_GREEN[0]}#{MENU_YELLOW[1]} h - Справка"
    puts "#{MENU_GREEN[0]}#{MENU_YELLOW[1]} e - Выход"
  end

  def help_add_train
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[2]} 1 - Добавить пасажирский поезд"
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[2]} 2 - Добавить грузовой поезд"
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[2]} h - Справка"
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[2]} e - Выход"
  end

  def help_delete_train
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[3]} 1 - Удалить пассажирский поезд"
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[3]} 2 - Удалить грузовой поезд"
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[3]} h - Справка"
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[3]} e - Выход"
end

  def help_wagon
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[4]} 1 - Добавить пассажирский вагон"
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[4]} 2 - Добавить грузовой вагон"
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[4]} 3 - Удалить пассажирский вагон"
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[4]} 4 - Удалить грузовой вагон"
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[4]} h - Справка"
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[4]} e - Выход"
  end

  def help_run_train
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[5]} 1 - Перемещение пассажирского поезда на следующую станцию"
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[5]} 2 - Перемещение грузового поезда на следующую станцию"
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[5]} 3 - Перемещение пассажирского поезда на предыдущую станцию"
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[5]} 4 - Перемещение грузового поезда на предыдущую станцию"
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[5]} h - Справка"
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[5]} e - Выход"
  end

  def helper_show
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[6]} 1 - Показать станции и поезда на них"
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[6]} h - Справка"
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[6]} e - Выход"
  end

  def helper_add_station
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[8]} 1 - Добавить станцию"
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[8]} h - Справка"
    puts "#{MENU_GREEN[0]}#{MENU_GREEN[1]}#{MENU_YELLOW[8]} e - Выход"
  end
end
