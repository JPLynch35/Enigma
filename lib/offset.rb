require 'date'

class Offset
  attr_reader :date_number

  def initialize
  end

  def generate_date_number(encrypt_date)
    if encrypt_date == 'today'
      @date = Date.today
    else
      @date = encrypt_date
    end
    day = @date.day.to_s.rjust(2, '0')
    month = @date.month.to_s.rjust(2, '0')
    year = @date.year.to_s[-2..-1]
    @date_number = (day + month + year).to_i
  end

  def calculate_offset(encrypt_date)
    generate_date_number(encrypt_date)
    offset = (@date_number**2)
    offset.digits.reverse.last(4)
  end
end
