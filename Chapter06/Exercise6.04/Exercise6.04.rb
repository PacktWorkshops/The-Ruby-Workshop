class PaymentTypes 

  include Enum 

  DATA = [ 

    [ WIRE = 1, :wire, "Wire"], 

    [ CHECK = 2, :check, "Check"], 

    [ CREDIT = 3, :credit, "Credit card"],     

  ] 

end 
module Enum 

  def self.included(base_class) 

    base_class.extend ClassMethods 

    base_class.class_eval do  

      attr_reader :id, :name, :label 

    end 

  end 

 

  module ClassMethods 

  end 

end 

def initialize(id, name, label=nil) 

    @id = id 

    @name = name 

    @label = label 

  end 

end 
pt = PaymentTypes.new(1, :wire, "Wire") 

pt.id 

pt.name 

pt.label  
pt = PaymentTypes.new(nil, :foo, "Huh?") 

module ClassMethods 

    def all 

      @all ||= begin 

        self::DATA.map { |args| new(*args) } 

      end 

    end 

  end
  PaymentTypes.all 
  class PaymentTypes 

  include Enum 

  DATA = [ 

    [ WIRE = 1, :wire, "Wire"], 

    [ CHECK = 2, :check, "Check"], 

    [ CREDIT = 3, :credit, "Credit card"],     

  ] 

  def wire? 

    id == WIRE 

  end 

  def check? 

    id == CHECK 

  end 

  def credit? 

    id == CREDIT 

  end 

end 
module Enum 

  def is_type?(type) 

    name.to_sym == type.to_sym 

  end 

  def method_missing(method, *args, &block) 

    interrogation_methods = self.class.all.map{|type| "#{type.name}?".to_sym} 

    if interrogation_methods.include?(method) 

      type = method.to_s.gsub("?", '').to_sym 

      is_type?(type) 

    else 

      super 

    end 

  end     

end 
PaymentTypes.all[0].wire? 

PaymentTypes.all[0].credit? 

PaymentTypes.all[2].wire? 

PaymentTypes.all[2].credit? 
