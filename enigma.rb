require_relative 'filereader'
require_relative 'rotation'
require_relative 'crypto'

class Enigma
  attr_reader :map
  def initialize
    @crypto = Crypto.new
    @rotation = Rotation.new
    @filereader = Filereader.new
    @char_map = ["a", "b", "c", "d", "e",
    "f", "g", "h", "i", "j", "k", "l",
    "m", "n", "o", "p", "q", "r", "s",
    "t", "u", "v", "w", "x", "y", "z",
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, " ",
    ".", ","]
  end

  def encrypt(message = @message, key = @key, offset = @offset)
    @encripted_string = ''
    encrypt_arrays
    #all_arrays = [a_char, b_char, c_char, d_char]
    until a_char.shift == nil do
      @encripted_string + a_char.shift
      @encripted_string + b_char.shift
      @encripted_string + c_char.shift
      @encripted_string + d_char.shift
    end
  end

  def encrypt_arrays
    crypto.build_char_arrays
    a_char.map! do |char|
      map_index = @char_map.index(char)
      char = @char_map(map_index + a + a_offset)
    end
    b_char.map! do |char|
      map_index = @char_map.index(char)
      char = @char_map(map_index + b + b_offset)
    end
    c_char.map! do |char|
      map_index = @char_map.index(char)
      char = @char_map(map_index + c + c_offset)
    end
    d_char.map! do |char|
      map_index = @char_map.index(char)
      char = @char_map(map_index + d + d_offset)
    end
  end

  def decrypt(encripted = @encripted, key = @key, offset = @offset)
  end

  def crack(encripted = @encripted)
  end

end

binding.pry
