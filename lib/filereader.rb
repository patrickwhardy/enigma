require 'pry'
#require 'File'

class FileReader
  attr_accessor :message, :encrypted
  def initialize
    @message = File.read(ARGV[0])
    @encrypted = File.read(ARGV[1])
  end

  def get_string(arg)
    File.read(arg)
  end

  def write_to_file(arg)
    File.write(arg)
  end

end
#binding.pry
