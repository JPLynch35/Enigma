require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'

class KeyTest < Minitest::Test
  def test_generates_5_digit_number
    new_key = Key.new

    assert_equal 5, new_key.random.count
  end

  def test_can_generate
  end
end
