def proc_method
    Proc.new
end

simple_proc = proc_method { "Hello World" }
simple_proc.call 