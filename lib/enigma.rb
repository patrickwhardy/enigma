require_relative 'filereader'
require_relative 'rotation'
require_relative 'crypto'
require 'pry'

class Enigma
  attr_reader :map, :encrypted_string, :decrypted_string
  def initialize
    #@filereader = FileReader.new
    @rotation = Rotation.new
    @rotation.setup
  end

  def encrypt(message = @filereader.message)
    crypto = Crypto.new(message)
    crypto.build_char_arrays
    @encrypted_string = ''
    @offset_index = 0
    #binding.pry
    #build char arrays is fucked
    crypto.all_char_arrays.each do |char_array|
      char_array = crypto.encrypt_arrays(char_array, @rotation.offset_array[@offset_index])
      @offset_index += 1
    end
    until crypto.a_char.count == 0 do
      crypto.all_char_arrays.each do |array|
        @encrypted_string.concat(array.slice!(0).to_s)
      end
    end

    @encrypted_string
  end

  def decrypt(message = @encrypted_string)
    crypto = Crypto.new(message)
    crypto.build_char_arrays
    @decrypted_string = ''
    @offset_index = 0
    # binding.pry
    crypto.all_char_arrays.each do |char_array|
      char_array = crypto.decrypt_arrays(char_array, @rotation.offset_array[@offset_index])
      @offset_index += 1
    end
    until crypto.a_char.count == 0 do
      crypto.all_char_arrays.each do |array|
        @decrypted_string.concat(array.slice!(0).to_s)
      end
    end
    @decrypted_string
  end

  def crack(encrpted = @encrypted)
    #string length -7 % 4 will return offset index of first . in ..end..
  end

end
