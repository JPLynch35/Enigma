require './test/test_helper'
require './lib/enigma'
require './lib/key'

class KeyTest < Minitest::Test
  def test_key_exists
    k = Key.new

    assert_instance_of Key, k
  end

  def test_can_generate_key_returns_
    k = Key.new
    encrypt_key = 'random'

    assert_equal String, k.generate_key(encrypt_key)
  end

  # def test_can_calculate_base_rotations
  #   k = Key.new
  #   encrypt_key = 'random'
  #
  #   assert_equal 0, k.calculate_base_rotation
  # end

  def test_can_accept_given_key
    e1 = Enigma.new
    e2 = Enigma.new
    encrypt1 = e1.encrypt("This works!..end..", "12345", Date.today)
    encrypt2 = e2.encrypt("And this is also now encrypted!..end..", "54321", Date.today)

    assert_equal "12345", e1.encrypt_key
    assert_equal "54321", e2.encrypt_key
  end

  def test_generates_five_digit_key
    e1 = Enigma.new
    e2 = Enigma.new
    encrypt1 = e1.encrypt("This works!..end..")
    encrypt2 = e2.encrypt("And this is also now encrypted!..end..")

    assert_equal 5, e1.encrypt_key.length
    assert_equal 5, e2.encrypt_key.length
  end

  def test_key_is_random
    e1 = Enigma.new
    e2 = Enigma.new
    e3 = Enigma.new
    encrypt1 = e1.encrypt("This works!..end..")
    encrypt2 = e2.encrypt("And this is also now encrypted!..end..")
    encrypt3 = e3.encrypt("Or is it? It is!..end..")

    refute_equal e1.encrypt_key, e2.encrypt_key
    refute_equal e2.encrypt_key, e3.encrypt_key
    refute_equal e3.encrypt_key, e1.encrypt_key
  end

  # def test_can_generate_four_base_rotations
  #   e1 = Enigma.new
  #   e2 = Enigma.new
  #   encrypt1 = e1.encrypt("This works!..end..")
  #   encrypt2 = e2.encrypt("And this is also now encrypted!..end..")
  #
  #   assert_equal 5, e1.encrypt_key.length
  #   assert_equal 5, e2.encrypt_key.length
  # end
  #
  # def test_base_rotations_have_two_digits
  # end
end
#
# e1 = Enigma.new
# e2 = Enigma.new
# e3 = Enigma.new
# e4 = Enigma.new
# encrypt1 = e1.encrypt("This works!..end..", "12345", Date.today)
# encrypt2 = e2.encrypt("And this is also now encrypted!..end..", "54321", Date.today)
# encrypt3 = e3.encrypt("Or is it? It is!..end..", "10405", Date.today)
# encrypt4 = e4.encrypt("Hello?..end..", "11111")
#
# assert_equal "n8^J?)]I5^Rc|5[>|F", encrypt1
# assert_equal " B.DX;$%o:>DE|>!oB)(o](2VM[^I[PEp](3pZ", encrypt2
# assert_equal "gyUr %]3Q%y3:pC)/^*wv^V", encrypt3
# assert_equal "asy18M]>x2q>?", encrypt4
