require_relative 'filereader'
require_relative 'rotation'
require_relative 'crypto'

class Enigma
  attr_reader :map
  def initialize
    @map = ["a", "b", "c", "d", "e",
    "f", "g", "h", "i", "j", "k", "l",
    "m", "n", "o", "p", "q", "r", "s",
    "t", "u", "v", "w", "x", "y", "z",
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, " ",
    ".", ","]
  end
#need to figure out how to grab local variables
  def encrypt
    return @message
  end

  def decrypt
  end

  def crack
  end

end

binding.pry
