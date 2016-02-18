gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'Date'
require_relative '../lib/rotation'

class RotationTest < Minitest::Test
  attr_reader :rotation
  def setup
    @rotation = Rotation.new
  end

  def test_generate_key_returns_5_character_string
    key = rotation.generate_key
    assert_equal String, key.class
    assert_equal 5, key.length
  end

  def test_date_format_returns_a_six_digit__string
    assert_equal "160216", rotation.date_format(Date.new(2016, 2, 16).to_s)
  end

  def test_offset_rotation_makes_offsets
    rotation.date_format(Date.new(2016, 2, 16).to_s)
    rotation.offset_rotation
    assert_equal 6, rotation.a_offset
    assert_equal 6, rotation.b_offset
    assert_equal 5, rotation.c_offset
    assert_equal 6, rotation.d_offset
  end

  def test_key_rotation_outputs_fixnum
    rotation.setup
    assert_equal Fixnum, rotation.a.class
    assert_equal Fixnum, rotation.b.class
    assert_equal Fixnum, rotation.c.class
    assert_equal Fixnum, rotation.d.class
  end

  def test_setup_builds_offset_array
    rotation.setup
    assert_equal 4, rotation.offset_array.count
  end

end
