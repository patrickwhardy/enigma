require 'pry'
require 'Date'
class Rotation
  attr_reader :a, :b, :c, :d, :a_offset, :b_offset, :c_offset, :d_offset
  attr_accessor :offset_array, :key, :today

  def initialize
    @key = ''#'12345' - use when hard-coding for test
    @today = ''
  end

  def setup
    # generate_key
    # date_format
    key_rotation
    offset_rotation
    final_offset
    build_offset_array
  end

  def generate_key
    5.times do
      i = Random.rand(0..9)
      @key << i.to_s
    end
    @key
  end
#use when hard-coding - (date = Date.new(2016, 2, 16).to_s)
  def date_format(date = Date.today.to_s)
    @today = date.slice(8..9) + date.slice(5..6) + date.slice(2..3)
    @today
  end

  def key_rotation
    @a_key = @key[0..1].to_i
    @b_key = @key[1..2].to_i
    @c_key = @key[2..3].to_i
    @d_key = @key[3..4].to_i
  end

  def offset_rotation
    square = @today.to_i * @today.to_i
    last_four = square.to_s[-4..-1]
    @a_offset = last_four[0].to_i
    @b_offset = last_four[1].to_i
    @c_offset = last_four[2].to_i
    @d_offset = last_four[3].to_i
  end

  def final_offset
    @a = @a_key + @a_offset
    @b = @b_key + @b_offset
    @c = @c_key + @c_offset
    @d = @d_key + @d_offset
  end

  def build_offset_array
    @offset_array = [@a, @b, @c, @d]
  end

end
