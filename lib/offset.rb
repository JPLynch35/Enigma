require 'date'

class Offset

  def initialize
    @date = Date.today
  end

  def generate_date_number
    day = @date.day.to_s.rjust(2, '0')
    month = @date.month.to_s.rjust(2, '0')
    year = @date.year.to_s[-2..-1]
    @date_number = (day + month + year).to_i
  end

  def calculate_offset
    generate_date_number
    squared_time_array = (@date_number**2).to_s.chars
    offset = squared_time_array[-4..-1]
  end

end
