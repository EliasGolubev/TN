module InstanceCounter
  
  @@count = 0
  
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    
    def instances
      self.class_variable_get(:@@count)
    end  
  end

  module InstanceMethods   
    private 
    def register_instance
      count = self.class.class_variable_get(:@@count) + 1
      self.class.class_variable_set(:@@count, count)  
    end
  end
end
