class Key
  attr_reader :key

  def initialize
    @key = {}
    @random = []
  end

  def random
      @random << 5.times.map { rand(1..9) }.join.to_i
  end
  b = ["a", "b"]
  a = [1, 2, 3]
  h = {}
  b.each_with_index do |num, i|
    h[num] = [a[i], a[i+1]].join
  end
end
k = Key.new
p k.random
