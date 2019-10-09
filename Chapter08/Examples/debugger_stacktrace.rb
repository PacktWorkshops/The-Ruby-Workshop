require 'byebug'

def func1
  func2
end

def func2
  func3
end

def func3
  byebug
end

func1