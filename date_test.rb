gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'linkedlist'

class DateTest < Minitest::Test

  def test_today_returns_formatted_date
    date = Date.new
    assert_equal date.today
end
