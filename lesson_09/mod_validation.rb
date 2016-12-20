module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validate_par
    
    def validate (args={})
      @validate_par ||= []
      def_hash = deafault_validate_format
      temp_hash = def_hash.merge(args)
      @validate_par << {name: temp_hash[:name], type: temp_hash[:type]}
    end

    def deafault_validate_format
      {name: 'deafault', type: 'deafault'}
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

    def validate!(par=nil)
      if !self.class.validate_par.nil?
        self.class.validate_par.each do |parameters|
          presence(parameters[:name]) if parameters[:type] == 'presence'
          format(parameters[:name], par) if parameters[:type] == 'format'
          type(parameters[:name], par) if parameters[:type] == 'type'
        end
      end
    end

    def presence name
      var = get_valid_variables(name)
      raise "Presence error" if var.nil? || var.to_s.empty?
    end

    def format (name, reg)
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