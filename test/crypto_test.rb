gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/crypto'

class CryptoTest < Minitest::Test
  attr_reader :crypto, :new_message
  def setup
    #@crypto = Crypto.new("whatsup")
    @crypto = Crypto.new("helloab")
  end

  def test_even_odd_builds_arrays
    crypto.even_odd
    assert_equal ["h", "t", "u"], crypto.odd
    assert_equal ["w", "a", "s", "p"], crypto.even
  end

  def test_a_and_c_arrays_built
    skip
    crypto.even_odd
    crypto.a_and_c_arrays
    assert_equal ["w", "s"], crypto.a_char
    assert_equal ["a", "p"], crypto.c_char
  end

  def test_b_and_d_arrays_built
    skip
    crypto.even_odd
    crypto.b_and_d_arrays
    assert_equal ["h", "u"], crypto.b_char
    assert_equal ["t"], crypto.d_char
  end
#meta single:true
  def test_encrypt_arrays_builds_encrypted_array
    skip
    crypto.build_char_arrays
    crypto.encrypt_arrays(crypto.a_char, 18)
    crypto.encrypt_arrays(crypto.b_char, 29)
    crypto.encrypt_arrays(crypto.c_char, 39)
    assert_equal "z", crypto.a_char[0]
    assert_equal "7", crypto.b_char[0]
    assert_equal "c", crypto.c_char[1]
    # assert_equal ["z", "v"], crypto.a_char
  end

  def test_decrypt_arrays_builds_original_char_array
    skip
    crypto.build_char_arrays
    crypto.encrypt_arrays(crypto.a_char, 3)
    assert_equal ["z", "v"], crypto.a_char
    crypto.decrypt_arrays(crypto.a_char, 3)
    assert_equal ["w", "s"], crypto.a_char
  end

  def test_build_char_arrays_returns_4_arrays
    skip
    crypto.build_char_arrays
    assert_equal [["w", "s"], ["h", "u"], ["a", "p"], ["t"]],  crypto.all_char_arrays
  end
end
