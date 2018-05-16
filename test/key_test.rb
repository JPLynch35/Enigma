require './test/test_helper'
require './lib/enigma'
require './lib/key'

class KeyTest < Minitest::Test
  def test_key_exists
    k = Key.new

    assert_instance_of Key, k
  end

  def test_can_calculate_four_base_rotations
    k = Key.new
    encrypt_key1 = "54321"

    assert_equal 4, k.calculate_base_rotation("54321").count
  end

  def test_base_rotations_have_two_digits
    k = Key.new
    base_rotation_array = k.calculate_base_rotation("54321")

    assert_equal 2, base_rotation_array[0].digits.size
  end

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
end
