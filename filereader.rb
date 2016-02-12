require 'pry'

class FileReader(ARGV)
  def initialize
    @message = get_message(ARGV[0])
    @encripted = get_encripted(ARGV[1])
  end

  def get_message(argument)
    File.open(argument)
  end

  def get_encripted(argument)
    File.open(argument)
  end

  def give_message
  end

  def give_encripted
  end

end
binding.pry
