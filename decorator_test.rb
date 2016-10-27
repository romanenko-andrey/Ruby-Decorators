require './decorator_methods.rb'

class MyClass
  include Decorators

  add_prefix('hello ')
  def a
    'from a'
  end

  add_postfix(' Good By!')
  def b
    'from b'
  end

  add_prefix('2 раза по 24 = ')
  add_postfix(' Каждому!')
  def c
    2*24
  end

  def empty_method
    'from empty_method'
  end
end

test = MyClass.new
puts test.a #=> hello from a
puts test.b #=> from b Good By!
puts test.c #=> 2 раза по 24 = 48 Каждому!
puts test.empty_method #=> from empty_method