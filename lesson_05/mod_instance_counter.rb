module InstanceCounter
  
  @@foo = 0
  
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    
    def instances
      self.class_variable_get(:@@foo)
    end  
  end

  module InstanceMethods   
    private 
    def register_instance
      count = self.class.class_variable_get(:@@foo) + 1
      self.class.class_variable_set(:@@foo, count)  
    end
  end
end
