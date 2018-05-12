class Enigma


  def encrypt(my_message, a = 5.times.map { rand(1..9) }, Date.today)
    generate_key
    calculate_offset
  end

  def decrypt
  end

  def crack
  end

  def create_shift
    #combine key and offset
  end
end
