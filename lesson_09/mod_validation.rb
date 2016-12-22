module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validate_par
    
    def validate(name, type, par=nil)
      @validate_par ||= []
      hash = {name: name, type: type, par: par}
      @validate_par << hash
    end
  end

  module InstanceMethods

    def valid?
      validate!
      true
    rescue
      false
    end

    private 

    def validate!
      self.class.validate_par.each do |vf|
        !vf[:par] ? self.send(vf[:type], vf[:name]) : self.send(vf[:type], vf[:name], vf[:par])
      end    
    end

    def presence(name)
      var = get_valid_variables(name)
      raise "Presence error" if var.nil? || var.to_s.empty?
    end

    def format(name, reg)
      var = get_valid_variables(name)
      raise "Format error" if var !~ reg
    end

    def type(name, parameter)
      var = get_valid_variables(name)
      raise "Type error" if var.class != parameter
    end
    
    def get_valid_variables(name)
      var_name = "@#{name}".to_sym
      var = instance_variable_get(var_name)
    end
  end
end
