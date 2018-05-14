require 'date'

class Offset

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

  def calculate_offset(date)
    generate_date_number(date)
    squared_time_array = (@date_number**2).to_s.chars
    offset = squared_time_array[-4..-1]
  end

end
