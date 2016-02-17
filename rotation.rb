require 'pry'
require 'Date'
class Rotation
  attr_reader :a, :b, :c, :d, :a_offset, :b_offset, :c_offset, :d_offset

  def initialize
    @key = ''
    @today = ''
  end

  def generate_key
    5.times do
      i = Random.rand(0..9)
      @key << i.to_s
    end
    @key
  end

  def date_format(date = Date.today.to_s)
    @today = date.slice(8..9) + date.slice(5..6) + date.slice(2..3)
    @today
  end

  def key_rotation
    @a = @key[0..1].to_i
    @b = @key[1..2].to_i
    @c = @key[2..3].to_i
    @d = @key[3..4].to_i
  end

  def offset_rotation
    square = @today.to_i * @today.to_i
    last_four = square.to_s[-4..-1]
    @a_offset = last_four[0].to_i
    @b_offset = last_four[1].to_i
    @c_offset = last_four[2].to_i
    @d_offset = last_four[3].to_i
  end

end


#binding.pry
