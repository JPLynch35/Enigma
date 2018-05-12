class Key
  attr_reader :key
  def initialize
   base_rotation = [11, 22, ]
  end

  def random_5_digit_number
     a = 5.times.map { rand(1..9) }
     #output 5d key 
  end

  def generate_base_rotation
    [a[i], a[i+1]].join
    # output base_rotation []
  end
end
