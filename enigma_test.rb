gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'enigma'

class EnigmaTest < Minitest::Test
  attr_reader :enigma
  def setup
    @enigma = Enigma.new
  end

  def test_encrypt_outputs_encrypted_string
    enigma.encrypt("whatsup")
    assert_equal 7,  enigma.encrypted_string.length
  end
end

# 3] pry(#<Enigma>)> crypto.all_char_arrays.each do |char_array|
# [3] pry(#<Enigma>)*   char_array = crypto.encrypt_arrays(char_array, (@rotation.offset_array[@offset_index]))
# [3] pry(#<Enigma>)*   @offset_index += 1
# [3] pry(#<Enigma>)* end
# TypeError: nil can't be coerced into Fixnum
# from /Users/patrickwhardy/Turing/1module/enigma/crypto.rb:65:in `+'
