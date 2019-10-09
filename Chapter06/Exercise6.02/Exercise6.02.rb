module HelperMethods 

 

  def to_hash 

    self.instance_variables.inject({}) do |map, iv| 

      map[iv] = self.instance_variable_get(iv)   

      map 

    end 

  end 

end 
class User 

 

    include HelperMethods 

    attr_accessor :id, :name, :email 

end 
u = User.new 

u.id = 1 

u.name = "Bob" 

u.email = "bob@example.com" 

u.to_hash 
module HelperMethods 

 

  def to_hash 

    self.instance_variables.inject({}) do |map, iv| 

      map[iv] = self.instance_variable_get(iv)   

      map 

    end 

  end 

 

  module ClassMethods 

    def attributes_for_json 

      [:name, :email] 

    end 

  end 

end 
module HelperMethods 

 

  def to_hash 

    formatted_class_attributes = self.class.attributes_for_json.map{|attr| "@#{attr}".to_sym} 

    filtered_ivars = self.instance_variables & formatted_class_attributes 

    filtered_ivars.inject({}) do |map, iv| 

      map[iv] = self.instance_variable_get(iv)   

      map 

    end 

  end 

 

  module ClassMethods 

    def attributes_for_json 

      [:name, :email] 

    end 

  end 

 

end 
class User 

 

  include HelperMethods 

  extend HelperMethods::ClassMethods 

  attr_accessor :id, :name, :email 

end 
u = User.new 

u.id = 1 

u.name = "Bob" 

u.email = "bob@example.com" 

u.to_hash 
