require_relative 'enigma'
require_relative 'rotation'
require 'pry'
class Encrypt
  attr_reader :enigma, :encrypted_file, :key, :today
  def initialize
    @enigma = Enigma.new
    @key = enigma.rotation.key
    @today = enigma.rotation.today
  end

  def pass_message_to_enigma(message=nil)
    message = message || File.read(ARGV[0]) 
    @encrypted_file = enigma.encrypt(message[1..-3])
  end

  def make_encrypted_file
    File.write(ARGV[1], encrypted_file)
    puts "Created '#{ARGV[1]}' with the key #{key} and date #{today}"
  end
end

if __FILE__ == $0
  e = Encrypt.new
  e.pass_message_to_enigma
  e.make_encrypted_file
end
