require 'test_helper'
require './lib/enigma'
require './lib/offset'
require './lib/key'

class EnigmaTest < Minitest::Test
  def test_can_encrypt_word
    e = Enigma.new(my_message, key, offset)
    my_message
  end
end
