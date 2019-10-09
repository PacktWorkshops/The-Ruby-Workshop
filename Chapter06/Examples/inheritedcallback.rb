module PrependedModule

 def output
  puts "Outputting from the PrependedModule"
  super
 end
end

class ParentClass
 prepend PrependedModule

 def self.inherited(klass)
  klass.send(:prepend, PrependedModule)
 end

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
