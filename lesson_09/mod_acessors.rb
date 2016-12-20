module Acessors
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    
    def attr_accessor_with_history(*attr_names)
      
      define_method(:add_history) do |sym_var_hist,  value|
          insv = instance_variable_get(sym_var_hist)
          insv ||= []
          insv << value
          instance_variable_set(sym_var_hist, insv)
      end
        
      send :private, :add_history

      attr_names.each do |name|
        var_name = "@#{name}".to_sym
        var_name_history = "@#{name}_hist".to_sym

        define_method(name) {instance_variable_get(var_name)}

        define_method("#{name}=".to_sym) do |value|
          instance_variable_set(var_name, value)
          add_history(var_name_history, value)
        end

        define_method("#{name}_hist".to_sym) { instance_variable_get(var_name_history) }
      end
    end

    def strong_attr_acessor(name, type)
      var_name = "@#{name}".to_sym
      
      define_method(name) { instance_variable_get(var_name) }

      define_method("#{name}=".to_sym) do |value|
      
      if value.class.to_s == type
        instance_variable_set(var_name, value)
      else
        raise "Type errors"
      end
    end
  end
end

  module InstanceMethods
  end
end