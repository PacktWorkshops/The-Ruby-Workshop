class MyClass
    def method_missing (method_name, *args, &block)
        puts "The method you have specified #{method_name} does not exist"
    end
end

obj1 = MyClass.new.xyz