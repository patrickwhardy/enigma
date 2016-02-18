require_relative 'filereader'
require_relative 'rotation'
require_relative 'crypto'
require 'pry'

class Enigma
  attr_reader :map, :encrypted_string
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

  def decrypt_offset_setup
    @offset_index = 0
    @rotation.offset_array each do |array|
      array.each do |offset|
        offset = -offset
      end
    end
  end

  def decrypt(encrypted = @encrypted)
    crypto = Crypto.new(@encrypted_string)
    crypto.build_char_arrays
    decrypt_offset_setup


  end

  def crack(encripted = @encripted)
    #string length -7 % 4 will return offset index of first . in ..end..
  end

end
