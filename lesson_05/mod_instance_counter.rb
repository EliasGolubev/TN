module InstanceCounter
  
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods    

    def instances
      class_variable_get(:@@instances)
    end  
  end

  module InstanceMethods   
   
    @@instances = 0

    private 

    def register_instance
      count = self.class.class_variable_get(:@@instances) + 1
      self.class.class_variable_set(:@@instances, count)  
    end
  end
end
