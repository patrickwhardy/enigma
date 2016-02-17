gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'crypto'

class CryptoTest < Minitest::Test
  attr_reader :crypto, :new_message
  def setup
    @crypto = Crypto.new
    @new_message = "whatsup"
  end

  def test_even_odd_builds_arrays
    # new_message = "whatsup"
    crypto.even_odd(new_message.split(''))
    assert_equal ["h", "t", "u"], crypto.odd
    assert_equal ["w", "a", "s", "p"], crypto.even
  end

  def test_a_and_c_arrays_built
    # new_message = "whatsup"
    crypto.even_odd(new_message.split(''))
    crypto.a_and_c_arrays
    assert_equal ["w", "s"], crypto.a_char
    assert_equal ["a", "p"], crypto.c_char
  end

  def test_b_and_d_arrays_built
    # new_message = "whatsup"
    crypto.even_odd(new_message.split(''))
    crypto.b_and_d_arrays
    assert_equal ["h", "u"], crypto.b_char
    assert_equal ["t"], crypto.d_char
  end

end
