require 'date'

class Offset
  attr_reader :offset

  def initialize
    @date = Date.today
  end

  def generate_date_number
    day = @date.day.to_s.rjust(2, '0')
    month = @date.month.to_s.rjust(2, '0')
    year = @date.year.to_s[-2..-1]
    @date_number = (day + month + year)
  end

  def calculate_offset
    @offset = @date_number.chars.to_i
  end

end
