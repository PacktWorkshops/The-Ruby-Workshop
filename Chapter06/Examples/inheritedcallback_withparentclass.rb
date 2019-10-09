module PrependedModule
 def output
  puts "Outputting from the PrependedModule"
  super
 end
 def self.prepended(base_class)
  puts "Included: #{base_class}"
  base_class.instance_eval do
   def self.inherited(klass)
    puts "Inherited: #{klass}"
    klass.send(:prepend, PrependedModule)
   end
  end
 end
end
class ParentClass
 prepend PrependedModule
 def output
  puts "Outputting from the parent class"
 end
end
class ChildClass < ParentClass
 def output
  puts "Outputting from the child class"
 end
end
puts ChildClass.new.output
