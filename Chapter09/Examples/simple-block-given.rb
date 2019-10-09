def my_method(&block)
    puts "Part one of my_method code"
    yield if block_given?
    puts "Part two of my_method code"
end

my_method {puts "Yield code from the Block if block is given"}