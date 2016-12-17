module Acessor
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
  
  
  module ClassMethods
    #
    # attr_accessor_with_history
    # Этот метод динамически создает геттеры и сеттеры для любого кол-ва атрибутов, 
    # при этом сеттер сохраняет все значения инстанс-переменной 
    # при изменении этого значения.
    #
    def attr_accessor_with_history(*attr_names)
      attr_names.each do |name|
        var_name = "@#{name}".to_sym

        define_method(name) { instance_variable_get(var_name) }

        define_method("#{name}=".to_sym) do |value|
          instance_eval("@#{name} ||= []; @#{name} << #{value}")
        end
        #
        # Также в класс, в который подключается модуль должен добавляться инстанс-метод
        # <имя_атрибута>_history
        # который возвращает массив всех значений данной переменной.
        #
        alias_method "#{name}_history".to_sym, name.to_sym
      end
    end

  #
  # strong_attr_acessor
  # который принимает имя атрибута и его класс. При этом создается геттер и сеттер 
  # для одноименной инстанс-переменной, но сеттер проверяет тип присваемоего значения.
  # Если тип отличается от того, который указан вторым параметром, 
  # то выбрасывается исключение. Если тип совпадает, то значение присваивается.
  #
  def strong_attr_acessor(name, type)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    
    define_method("#{name}=".to_sym) do |value|
      if value.class.to_s == type
        instance_eval("@#{name} = #{value}")
      else
        raise "No correct type"
      end
    end

  end
end

  module InstanceMethods
  end
end
