require 'test_helper'
require './lib/key'

class KeyTest < Minitest::Test
  def test_generates_5_digit_number
    new_key = Key.new

    assert_equal 5, new_key.method.
  end

  def test_can_generate_4_keys
  end
end
