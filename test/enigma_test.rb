gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test
  attr_reader :enigma
  def setup
    @enigma = Enigma.new
  end

  def test_encrypt_outputs_encrypted_string
    skip
    enigma.encrypt("this is so secret ..end..")
    assert_equal 25,  enigma.encrypted_string.length
  end

  def test_encrypted_string_is_correct
    enigma.encrypt("helloab")
    assert_equal "z7lx63b", enigma.encrypted_string
  end

  def test_decrypt_gets_original_message
    enigma.encrypt("this is so secret")
    enigma.decrypt
    assert_equal "this is so secret", enigma.decrypted_string
  end

end

# 3] pry(#<Enigma>)> crypto.all_char_arrays.each do |char_array|
# [3] pry(#<Enigma>)*   char_array = crypto.encrypt_arrays(char_array, (@rotation.offset_array[@offset_index]))
# [3] pry(#<Enigma>)*   @offset_index += 1
# [3] pry(#<Enigma>)* end
# TypeError: nil can't be coerced into Fixnum
# from /Users/patrickwhardy/Turing/1module/enigma/crypto.rb:65:in `+'
