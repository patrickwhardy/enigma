gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test
  attr_reader :enigma
  def setup
    @enigma = Enigma.new
  end
#the first two tests are written to work with the key hard-coded as '12345'
  def test_encrypt_outputs_encrypted_string
    enigma.encrypt("this is so secret ..end..")
    assert_equal ". i4p.sj e 4w5rq.0.kwddkq",  enigma.encrypted_string
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

  def test_that_crack_returns_end
    enigma.encrypt("this is so secret ..end..")
    assert_equal "this is so secret ..end..", enigma.crack(enigma.encrypted_string)
  end

end
