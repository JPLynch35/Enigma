class Key
  attr_reader :key

  def initialize
  end

  def generate_key(encrypt_key)
    if encrypt_key == 'random'
      @key = 5.times.map{rand(10)}.join
    else
      @key = encrypt_key
    end
  end

  def calculate_base_rotation(encrypt_key)
    generate_key(encrypt_key)
    4.times.map do |i|
      [@key[i], @key[i+1]].join.to_i
    end
  end
end
