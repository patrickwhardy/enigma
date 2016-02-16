require 'pry'
require 'Date'
class Rotation
  attr_reader :key, :offset

  def initialize
    @key = ''
    @offset = ''
  end

  def generate_key
    5.times do
      i = Random.rand(0..9)
      @key << i.to_s
    end
    @key
  end

  def date_format(date)
    string = Date.today.to_s
    @offset = string.slice(8..9) + string.slice(5..6) + string.slice(2..3)
  end

  def offset_rotation
  end

end


#binding.pry
