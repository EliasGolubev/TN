module InstanceCounter
  
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
    base.init
  end

  module ClassMethods    

    def init
      class_variable_set(:@@instances, 0)
    end
    
    def instances
      class_variable_get(:@@instances)
    end  
  end

  module InstanceMethods   

    private 

    def register_instance
      count = self.class.class_variable_get(:@@instances) + 1
      self.class.class_variable_set(:@@instances, count)  
    end
  end
end