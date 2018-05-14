class Key

  def initialize
    @base_rotations = []
  end

  def generate_key(encrypt_key)
    if encrypt_key == 'random'
      key = 5.times.map{rand(10)}
      @key = key.to_s
    else
      @key = encrypt_key
    end
  end

  def calculate_base_rotation(encrypt_key)
    generate_key(encrypt_key)
    4.times do |i|
      offset = [@key[i], @key[i+1]].join
      @base_rotations << offset
    end
    @base_rotations
  end

end
