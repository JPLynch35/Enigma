require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_does_it_exist
    e = Enigma.new

    assert_instance_of Enigma, e
  end

  def test_can_encrypt_word_with_a_given_key
    e1 = Enigma.new
    e2 = Enigma.new
    e3 = Enigma.new
    e4 = Enigma.new
    encrypt1 = e1.encrypt("This works!..end..", "12345", Date.today)
    encrypt2 = e2.encrypt("And this is also now encrypted!..end..", "54321", Date.today)
    encrypt3 = e3.encrypt("Or is it? It is!..end..", "10405", Date.today)
    encrypt4 = e4.encrypt("Hello?..end..", "11111")

    assert_equal "n8^J?)]I5^Rc|5[>|F", encrypt1
    assert_equal " B.DX;$%o:>DE|>!oB)(o](2VM[^I[PEp](3pZ", encrypt2
    assert_equal "gyUr %]3Q%y3:pC)/^*wv^V", encrypt3
    assert_equal "asy18M]>x2q>?", encrypt4
  end

  def test_can_encrypt_word_without_a_given_key
    e1 = Enigma.new
    e2 = Enigma.new
    e3 = Enigma.new
    e4 = Enigma.new
    encrypt1 = e1.encrypt("This works!..end..")
    encrypt2 = e2.encrypt("And this is also now encrypted!..end..")
    encrypt3 = e3.encrypt("Or is it? It is!..end..")
    encrypt4 = e4.encrypt("Hello?..end..")

    refute_equal "n8^J?)]I5^Rc|5[>|F", encrypt1
    refute_equal " B.DX;$%o:>DE|>!oB)(o](2VM[^I[PEp](3pZ", encrypt2
    refute_equal "gyUr %]3Q%y3:pC)/^*wv^V", encrypt3
    refute_equal "asy18M]>x2q>?", encrypt4
  end

  def test_calculate_total_rotations_returns_combined
    e= Enigma.new
    base_rotation_array = [10, 20, 30, 40]
    offset_array = [1, 2, 3, 4]
    expected = [11, 22, 33, 44]
    total_array = e.calculate_total_rotations(base_rotation_array, offset_array)

    assert_equal expected, total_array
  end

  def test_create_all_character_map_creations_returns_combined_array
    e = Enigma.new
    total_rotation_array = [1, 2, 3, 4]
    all_encryption_maps = e.create_all_character_map_creations(total_rotation_array)

    assert_instance_of Array, all_encryption_maps
  end

  def test_can_decrypt_message
    e1 = Enigma.new
    e2 = Enigma.new
    e3 = Enigma.new
    e4 = Enigma.new
    decrypt1 = e1.decrypt("n8^J?)]I5^Rc|5[>|F", "12345", Date.today)
    decrypt2 = e2.decrypt(" B.DX;$%o:>DE|>!oB)(o](2VM[^I[PEp](3pZ", "54321", Date.today)
    decrypt3 = e3.decrypt("gyUr %]3Q%y3:pC)/^*wv^V", "10405", Date.today)
    decrypt4 = e4.decrypt("asy18M]>x2q>?", "11111")

    assert_equal "This works!..end..", decrypt1
    assert_equal "And this is also now encrypted!..end..", decrypt2
    assert_equal "Or is it? It is!..end..", decrypt3
    assert_equal "Hello?..end..", decrypt4
  end

  def test_can_decrypt_message_without_date
    e1 = Enigma.new
    e2 = Enigma.new
    e3 = Enigma.new
    e4 = Enigma.new
    decrypt1 = e1.decrypt("n8^J?)]I5^Rc|5[>|F", "12345")
    decrypt2 = e2.decrypt(" B.DX;$%o:>DE|>!oB)(o](2VM[^I[PEp](3pZ", "54321")
    decrypt3 = e3.decrypt("gyUr %]3Q%y3:pC)/^*wv^V", "10405")
    decrypt4 = e4.decrypt("asy18M]>x2q>?", "11111")

    assert_equal "This works!..end..", decrypt1
    assert_equal "And this is also now encrypted!..end..", decrypt2
    assert_equal "Or is it? It is!..end..", decrypt3
    assert_equal "Hello?..end..", decrypt4
  end

  def test_can_crack_encryption_with_a_given_date
    e1 = Enigma.new
    e2 = Enigma.new
    e3 = Enigma.new
    e4 = Enigma.new
    crack1 = e1.crack("n8^J?)]I5^Rc|5[>|F", Date.today)
    crack2 = e2.crack(" B.DX;$%o:>DE|>!oB)(o](2VM[^I[PEp](3pZ", Date.today)
    crack3 = e3.crack("gyUr %]3Q%y3:pC)/^*wv^V", Date.today)
    crack4 = e4.crack("asy18M]>x2q>?", Date.today)

    assert_equal "This works!..end..", crack1
    assert_equal "And this is also now encrypted!..end..", crack2
    assert_equal "Or is it? It is!..end..", crack3
    assert_equal "Hello?..end..", crack4
  end

  def test_can_crack_encryption_without_a_given_date
    e1 = Enigma.new
    e2 = Enigma.new
    e3 = Enigma.new
    e4 = Enigma.new
    e5 = Enigma.new
    e6 = Enigma.new
    crack1 = e1.crack("n8^J?)]I5^Rc|5[>|F")
    crack2 = e2.crack(" B.DX;$%o:>DE|>!oB)(o](2VM[^I[PEp](3pZ")
    crack3 = e3.crack("gyUr %]3Q%y3:pC)/^*wv^V")
    crack4 = e4.crack("asy18M]>x2q>?")
    crack5 = e5.crack("Zk;k$lF:gHiwx;x4u$T:s8f g0R:3.gz$(l5h%Y $R7E@Gu(.|t]!?7A:Sy/k$Q/%")
    crack6 = e6.crack("K/bJ2?l2R1@Vio/cfdz2dU.jRWx2nY,Y2i%dSe5j2 G0zz>uws<xyrG6!.?3Vdw33")

    assert_equal "This works!..end..", crack1
    assert_equal "And this is also now encrypted!..end..", crack2
    assert_equal "Or is it? It is!..end..", crack3
    assert_equal "Hello?..end..", crack4
    assert_equal "THIS IS a very long message with symbols *&^9084637782&@)(..end..", crack5
    assert_equal "THIS IS a very long message with symbols *&^9084637782&@)(..end..", crack6
  end

  def test_crack_rotation_1_for_1_rotation
    e = Enigma.new
    output = "oe,,"
    rotation_1 = e.crack_rotation_1("oe,,")

    assert_equal 1, rotation_1
  end

  def test_crack_rotation_2_for_1_rotation
    e = Enigma.new
    output = "oe,,"
    rotation_2 = e.crack_rotation_2("oe,,")

    assert_equal 1, rotation_2
  end

  def test_crack_rotation_3_for_1_rotation
    e = Enigma.new
    output = "oe,,"
    rotation_3 = e.crack_rotation_3("oe,,")

    assert_equal 1, rotation_3
  end

  def test_crack_rotation_4_for_1_rotation
    e = Enigma.new
    output = "oe,,"
    rotation_4 = e.crack_rotation_4("oe,,")

    assert_equal 1, rotation_4
  end

  def test_select_rotation_for_last_symbol_correctly_rotates
    e = Enigma.new
    output = "of@#"
    total_rotation_1 = 4
    total_rotation_2 = 3
    total_rotation_3 = 2
    total_rotation_4 = 1
    expected = [1, 2, 3, 4]
    sort_rotation_array = e.select_rotation_for_last_symbol(output, total_rotation_1, total_rotation_2, total_rotation_3, total_rotation_4)

    assert_equal expected, sort_rotation_array
  end

  def test_create_all_character_map_creations_for_decrypt_crack_returns_array_of_hashes
    e = Enigma.new
    total_rotation_array = [1, 2, 3, 4]
    all_encryption_maps = e.create_all_character_map_creations(total_rotation_array)

    assert_instance_of Hash, all_encryption_maps[0]
    assert_instance_of Hash, all_encryption_maps[1]
    assert_instance_of Hash, all_encryption_maps[2]
    assert_instance_of Hash, all_encryption_maps[3]
  end

  def test_calculate_crack_base_rotation_array_returns_correct_array
    e = Enigma.new
    offset_array = [1, 1, 1, 1]
    total_rotation_array = [10, 11, 12, 13]
    expected = [9, 10, 11, 12]
    calc = e.calculate_crack_base_rotation_array(offset_array, total_rotation_array)

    assert_equal expected, calc
  end

  def test_check_base_rotation_array_for_single_digits
    e = Enigma.new
    base_rotation_array = [2, 23, 4, 45]
    expected = ["02", "23", "04", "45"]
    corrected_base_rotation_array = e.check_base_rotation_array_for_single_digits(base_rotation_array)

    assert_equal expected, corrected_base_rotation_array
  end

  def test_caculate_5_digit_key_combines_correctly
    e = Enigma.new
    base_rotation_array = [12, 23, 34, 45]
    expected = "12345"
    encrypt_key = e.caculate_5_digit_key(base_rotation_array)

    assert_equal expected, encrypt_key
  end

  def test_caculate_5_digit_key_returns_error_message
    e = Enigma.new
    base_rotation_array = [13, 23, 37, 45]
    expected = "Error, manually break code through additions of 84 to rotations."
    encrypt_key = e.caculate_5_digit_key(base_rotation_array)

    assert_equal expected, encrypt_key
  end

end
