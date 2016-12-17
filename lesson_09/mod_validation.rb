module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
  #
  # Содержит метод класса validate. 
  # Этот метод принимает в качестве параметров имя проверяемого атрибута, 
  # а также тип валидации и при необходимости дополнительные параметры.
  # 
    def validate(par = {}, &block)
      #
      # format (при этом отдельным параметром задается регулярное выражение для формата). 
      # Треубет соответствия значения атрибута заданному регулярному выражению. 
      #
      if block_given?      
       raise "Name error" if block.call
      else
        #
        # presence - требует, чтобы значение атрибута было не nil 
        # и не пустой строкой.
        #
        if par.include?(:name)
          raise "Presence error" if par[:name] == nil || par[:name] == ""
        #
        # type (третий параметр - класс атрибута). 
        # Требует соответствия значения атрибута заданному классу
        #
        elsif par.include?(:number) && par.include?(:type)
          raise "Type error" if par[:number].class.to_s != par[:type]
        end   
      end
    end  
  end

  module InstanceMethods
    
    #
    # Содержит инстанс-метод valid? который возвращает true, 
    # если все проверки валидации прошли успешно и false, если есть ошибки валидации.
    #
    def valid?(par = {}, regexp)
      validate!(par, regexp)
      true
    rescue
      false
    end  

    private
    
    #   
    # Содержит инстанс-метод validate!, который запускает все проверки (валидации), 
    # указанные в классе через метод класса validate.
    # В случае ошибки валидации выбрасывает исключение с 
    # сообщением о том, какая именно валидация не прошла
    #
    def validate!(par = {}, regexp=nil)
      if par.include?(:name)
        self.class.validate :name => par[:name]
      elsif par.include?(:number) && par.include?(:type)
        self.class.validate :number => par[:number], :type => par[:type]
      elsif par.include?(:station)         
        self.class.validate :station => par[:station] { par[:station] !~ regexp }
      else
        raise "No parameters"
      end
    end  
  end 
end
