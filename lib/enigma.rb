require_relative 'rotation'
require_relative 'crypto'
require 'pry'

class Enigma
  attr_reader :map, :encrypted_string, :decrypted_string,
              :rotation
  def initialize
    @rotation = Rotation.new
    @rotation.generate_key
    @rotation.date_format
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
    return @encrypted_string
  end

  def decrypt(message = @encrypted_string)
    crypto = Crypto.new(message)
    crypto.build_char_arrays
    @decrypted_string = ''
    @offset_index = 0
    crypto.all_char_arrays.each do |char_array|
      char_array = crypto.decrypt_arrays(char_array, @rotation.offset_array[@offset_index])
      @offset_index += 1
    end
    until crypto.a_char.count == 0 do
      crypto.all_char_arrays.each do |array|
        @decrypted_string.concat(array.slice!(0).to_s)
      end
    end
    return @decrypted_string
  end

  def crack(message = @encrypted_string)
    0.upto(99999) do |key|
      temp_key = key.to_s.rjust(5, "0")
      @rotation.key = temp_key
      temp_message = decrypt(message)
        return temp_message if temp_message[-7..-1] == "..end.."
        end
  end

end

# if __FILE__ == $0
#    e = Enigma.new
# end

# key = @rotation.key, date = @rotation.date)
#  @rotation.key = key
#  @rotation.date_format(date)
#  @rotation.setup
