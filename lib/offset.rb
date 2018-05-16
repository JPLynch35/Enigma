require 'date'

class Offset
  attr_reader :date_number

  def initialize(encrypt_key)
    @date_number = nil
    generate_date_number(encrypt_date)
  end

  def generate_date_number(encrypt_date)
    if encrypt_date == 'today' || encrypt_date == Date.today
      date = Date.today
      day = date.day.to_s.rjust(2, '0')
      month = date.month.to_s.rjust(2, '0')
      year = date.year.to_s[-2..-1]
      @date_number = (day + month + year).to_i
    else
      @date_number = encrypt_date.to_i
    end
  end

  def calculate_offset
    offset = (@date_number**2)
    offset.digits.reverse.last(4)
  end
end
