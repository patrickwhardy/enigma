gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'filereader'
require 'pry'

class LinkedlistTest < Minitest::Test
#how do you enter commandline args in minitest?
  def test_get_message_returns_contents
    filereader = FileReader.new
    asser_equal "message", @message
  end

end
