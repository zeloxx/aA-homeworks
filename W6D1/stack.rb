class Stack

  attr_reader :underlying_array

  def initialize
    @underlying_array = []
  end

  def push(el)
    underlying_array.push(el)
    el
  end

  def pop
    underlying_array.pop
  end

  def peek
    underlying_array.last
  end

end