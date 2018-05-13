class Key
  attr_reader :key
  def initialize
   base_rotations = []
  end

  def random_5_digit_number
     key = 5.times.map { rand(1..9) }
     #output 5d key
  end

  def generate_base_rotation
    base_rotations = [key[i], key[i+1]].join
    # output base_rotation []
  end
end
