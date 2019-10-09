def my_method(&block)
    puts "Part one of my_method code"
    yield
    puts "Part two of my_method code"
end

my_method {puts "Yield code from the Block if block"}