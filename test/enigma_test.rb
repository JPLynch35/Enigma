require './test/test_helper'
require './lib/enigma'
require './lib/key'
require './lib/offset'

class EnigmaTest < Minitest::Test
  def test_does_it_exist
    e = Enigma.new

    assert_instance_of Enigma, e
  end

  # def test_calculate_total_rotations
  #   e = Enigma.new
  #   @base_rotation_array = [12, 45, 32, 56]
  #   @offset_array = [1, 2, 3, 4]
  #   e.calculate_total_rotations
  #
  #   assert_equal [13, 47, 35, 60], @total_rotation_array
  # end

  def test_can_encrypt_word
    e1 = Enigma.new
    e2 = Enigma.new
    e3 = Enigma.new
    e4 = Enigma.new
    encrypt1 = e1.encrypt("This works!", "12345", Date.today)
    encrypt2 = e2.encrypt("And this is also now encrypted!", "54321", Date.today)
    encrypt3 = e3.encrypt("Or is it? It is!", "12468", Date.today)
    encrypt4 = e4.encrypt("Hello?", "11111")

    assert_equal ">w8?l.!/L8G", encrypt1
    assert_equal "XM)O$G;:BHFOxKF]BMBABDA,@XC/2Ca", encrypt2
    assert_equal "T7EAx<9LD<iL#x^f", encrypt3
    assert_equal "asy18M", encrypt4
  end

  def test_can_crack_encryption
    e1 = Enigma.new
    crack1 = e1.crack("T<]t7r]>", Date.today)

    assert_equal "A..end..", crack1
  end
end
