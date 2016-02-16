gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'Date'
require_relative 'rotation'

class RotationTest < Minitest::Test

  def test_generate_key_returns_a_key
    rotation = Rotation.new
    key = rotation.generate_key
    assert_equal 5, key.length
  end

  def test_date_format_returns_six_digits
    rotation = Rotation.new
    offset = rotation.date_format(Date.today)
    assert_equal 6, offset.length
  end



end
