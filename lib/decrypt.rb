require_relative 'enigma'
require_relative 'rotation'
require 'pry'
class Decrypt
  attr_reader :enigma, :decrypted_file, :key, :today
  def initialize
    @enigma = Enigma.new
    @key = ARGV[2]
    @today = ARGV[3]
    enigma.rotation.key = @key
    enigma.rotation.today = @today
    enigma.rotation.setup
  end

  def pass_message_to_enigma
    message = File.read(ARGV[0])
    @decrypted_file = enigma.decrypt(message)
  end

  def make_decrypted_file
    File.write(ARGV[1], decrypted_file)
    puts "Created '#{ARGV[1]}' with the key #{key} and date #{today}"
  end
end

if __FILE__ == $0
  e = Decrypt.new
  e.pass_message_to_enigma
  e.make_decrypted_file
end
