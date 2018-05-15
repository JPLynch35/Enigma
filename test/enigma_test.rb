require './test/test_helper'
require './lib/enigma'
require './lib/key'
require './lib/offset'

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
      crack1 = e1.crack("n8^J?)]I5^Rc|5[>|F")
      crack2 = e2.crack(" B.DX;$%o:>DE|>!oB)(o](2VM[^I[PEp](3pZ")
      crack3 = e3.crack("gyUr %]3Q%y3:pC)/^*wv^V")
      crack4 = e4.crack("asy18M]>x2q>?")

      assert_equal "This works!..end..", crack1
      assert_equal "And this is also now encrypted!..end..", crack2
      assert_equal "Or is it? It is!..end..", crack3
      assert_equal "Hello?..end..", crack4
    end

end
