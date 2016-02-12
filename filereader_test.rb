gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'linkedlist'
require 'pry'

class LinkedlistTest < Minitest::Test

  def test_get_message_returns_contents
    message = File.new
    asser_equal "message", message.get_message
end
