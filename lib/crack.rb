require_relative 'enigma'
require_relative 'rotation'
require 'pry'
class Encrypt
  attr_reader :enigma, :cracked_file, :key, :today
  def initialize
    @enigma = Enigma.new
    @key = enigma.rotation.key
    @today = enigma.rotation.today
  end

  def pass_message_to_enigma
    message = File.read(ARGV[0])
    @cracked_file = enigma.crack(message)
    #binding.pry
  end

  def make_cracked_file
    File.write(ARGV[1], cracked_file)
    puts "Created '#{ARGV[1]}' with the cracked key #{key} and date #{today}"
  end
end

if __FILE__ == $0
  e = Encrypt.new
  e.pass_message_to_enigma
  e.make_cracked_file
end
