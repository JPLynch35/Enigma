require 'test_helper'
require './lib/offset'
require 'pry'

class OffsetTest < Minitest::Test
  def test_1
  end
  def test_2
  end
  def test_3
  end
end
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
