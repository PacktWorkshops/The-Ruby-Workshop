module Enum

  def self.included(base_class)
    base_class.extend ClassMethods
    base_class.class_eval do 
      attr_reader :id, :name, :label     
    end
  end  

  def initialize(id, name, label=nil)
    @id = id
    @name = name
    @label = label
  end

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

  module ClassMethods
    def all
      @all ||= begin
        self::DATA.map { |args| new(*args) }
      end
    end
  end
    
end

class PaymentTypes
  include Enum
  DATA = [
    [ WIRE = 1, :wire, "Wire"],
    [ CHECK = 2, :check, "Check"],
    [ CREDIT = 3, :credit, "Credit card"],    
  ]
end



class User
  def self.output
    return "Global User"
  end
end

module Report
  def self.test_namespace
    User.output
  end

  def self.test_global
    ::User.output
  end

  class User
    def self.output
      return "Report::User"
    end
  end
end


module ClassLogger
  def log(msg)
    "[#{self.class}] #{msg}"
  end
end

class User
  include ClassLogger

  def log(msg)
    "[#{Time.now.to_f.to_s}] #{super(msg)}"
  end
end

class Company
  prepend ClassLogger
  def log(msg)
    "[#{Time.now.to_f.to_s}] #{super(msg)}"
  end  
end
