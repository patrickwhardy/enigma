require_relative 'enigma'
require 'pry'
require 'Date'
class Crypto
  attr_reader :odd, :even, :char_map
  attr_accessor :a_char, :b_char, :c_char, :d_char, :all_char_arrays

  def initialize(message)
    @message = message
    @message_array = message.split('')
    @char_map = ["a", "b", "c", "d", "e",
    "f", "g", "h", "i", "j", "k", "l",
    "m", "n", "o", "p", "q", "r", "s",
    "t", "u", "v", "w", "x", "y", "z",
    "0", "1", "2", "3", "4", "5", "6",
    "7", "8", "9", " ", ".", ","]
  end

  def even_odd(message_array = @message_array)
    @even = []
    @odd = []
    (message_array.count).times do |i|
      if i.even? == true
      @even << message_array.slice!(0)
    else
      @odd << message_array.slice!(0)
    end
    end
  end

  def a_and_c_arrays(array = @even)
    @a_char = []
    @c_char = []
    (array.count).times do |i|
      if i.even? == true
        @a_char << array.slice!(0)
      else
        @c_char << array.slice!(0)
      end
    end
  end

  def b_and_d_arrays(array = @odd)
    @b_char = []
    @d_char = []
    (array.count).times do |i|
      if i.even? == true
        @b_char << array.slice!(0)
      else
        @d_char << array.slice!(0)
      end
    end
  end

  def build_char_arrays
    even_odd
    a_and_c_arrays
    b_and_d_arrays
    @all_char_arrays = [@a_char, @b_char, @c_char, @d_char]
  end

  def encrypt_arrays(char_array, offset)
    char_array.map! do |char|
      map_index = @char_map.index(char)
      #binding.pry
      adjusted_index = (map_index + offset)
        adjusted_index = adjusted_index % 39
      char = @char_map[adjusted_index]
    end
  end

  def decrypt_arrays(char_array, offset)
    char_array.map! do |char|
      map_index = @char_map.index(char)
      adjusted_index = (map_index - offset)
        adjusted_index = adjusted_index % 39
      char = @char_map[adjusted_index]
    end
  end

end
