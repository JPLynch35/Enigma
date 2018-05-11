require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'
require 'pry'

class KeyTest
  def test_creates_key
    key = Key.new
    assert_equal , key
  end

end
