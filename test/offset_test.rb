require './test/test_helper'
require './lib/offset'
require 'pry'

class OffsetTest < Minitest::Test
  def test_offset_exists
    o = Offset.new

    assert_instance_of Offset, o
  end

  # def test_generate_date_number_returns_integer
  #   o = Offset.new
  #
  #   assert_equal Integer, o.generate_date_number(Date.today).class
  # end
  #
  # def test_date_number_six_digit_format
  #   o = Offset.new
  #   o.generate_date_number(Date.today)
  #
  #   assert_equal 6, o.date_number.to_s.length
  # end
  #
  # def test_can_calculate_four_element_offset
  #   o = Offset.new
  #
  #   assert_equal 4, o.calculate_offset(Date.today).length
  # end
end
