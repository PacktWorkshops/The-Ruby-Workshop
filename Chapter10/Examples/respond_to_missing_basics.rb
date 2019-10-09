class MyClass
    def method_missing (method_name, *args, &block)
        if method_name.to_s == "xyz"
            puts "You are now in ghost method"
        else 
            super
        end
    end

    def respond_to_missing?(method_name,  include_private = false)
        method_name.to_s.start_with?('x') || super
    end
end

obj1 = MyClass.new
obj1.xyz
puts obj1.respond_to?(:xyz)
