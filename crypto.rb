require_relative 'filereader'
require 'pry'
require 'Date'
class Crypto
  attr_reader :odd, :even, :a_char, :b_char, :c_char, :d_char

  def initialize
    #@message_array = @message.split('')
  end

  def even_odd(message_array = @message_array)
    @even = []
    @odd = []
    message_array.each do |char|
      if (message_array.index(char)).odd?
        @odd << char
      else
        @even << char
      end
    end
  end

  def a_and_c_arrays(array = @even)
    @a_char = []
    @c_char = []
    array.each do |char|
      if (array.index(char)).even?
        @a_char << char
      else
        @c_char << char
    end
    end
  end

  def b_and_d_arrays(array = @odd)
    @b_char = []
    @d_char = []
    array.each do |char|
      if (array.index(char)).even?
        @b_char << char
      else
        @d_char << char
    end
    end
  end

  def build_char_arrays
    even_odd
    a_and_c_arrays
    b_and_d_arrays
  end

  #binding.pry
end
