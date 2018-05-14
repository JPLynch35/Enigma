class Key
  attr_reader :key
              :base_rotations

  def initialize
    @base_rotations = []
  end

  def generate_key(key = 5.times.map{rand(10)})
     @key = key.to_s
     # key = 5.times.map { rand(1..9) }
     #output 5d key
  end

  def calculate_base_rotation(generate_key)
    4.times do |i|
      offset = [generate_key[i], generate_key[i+1]].join
      @base_rotations << offset
    end
    @base_rotations
  end

end
