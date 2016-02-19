require_relative 'filereader'
require_relative 'enigma'
require_relative 'rotation'
require 'pry'
class Encrypt
  attr_reader :enigma, :encrypted_file
  def initialize
    @filereader = FileReader.new
    @enigma = Enigma.new
    # @encrypted_file = ARGV[1]
    binding.pry
  end

  def pass_message_to_enigma
    message = File.read(ARGV[0])
    @encrypted_file = enigma.encrypt(message)
  end

  def make_encrypted_file
    File.write(ARGV[1], encrypted_file)
    puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"
  end
end

if __FILE__ == $0
  e = Encrypt.new
  e.pass_message_to_enigma
  puts "Created #{@encrypted_file}
  with the key #{@rotation.key}
  and the date #{@rotation.today}"
end
