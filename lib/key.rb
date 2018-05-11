require 'pry'
class Key

  b = ["a", "b"]
  a = [1, 2, 3]

  h = {}

  b.each_with_index do |num, i|
    h[num] = [a[i], a[i+1]].join
  end
end
