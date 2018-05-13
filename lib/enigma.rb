class Enigma

  def initialize
    @character_map = {"a" => "a",
                    "b" => "b",
                    "c" => "c",
                    "d" => "d",
                    "e" => "e",
                    "f" => "f",
                    "g" => "g",
                    "h" => "h",
                    "i" => "i",
                    "j" => "j",
                    "k" => "k",
                    "l" => "l",
                    "m" => "m",
                    "n" => "n",
                    "o" => "o",
                    "p" => "p",
                    "q" => "q",
                    "r" => "r",
                    "s" => "s",
                    "t" => "t",
                    "u" => "u",
                    "v" => "v",
                    "w" => "w",
                    "x" => "x",
                    "y" => "y",
                    "z" => "z",
                    "1" => "1",
                    "2" => "2",
                    "3" => "3",
                    "4" => "4",
                    "5" => "5",
                    "6" => "6",
                    "7" => "7",
                    "8" => "8",
                    "9" => "9",
                    "0" => "0",
                    " " => " ",
                    "." => ".",
                    "," => ",",}
    @five_digit_key = Key.new
    @date_offset = Offset.new
  end

  def total_rotations
    a_total_rotation = a_base_rotation + a_offset
    b_total_rotation = b_base_rotation + b_offset
    c_total_rotation = c_base_rotation + c_offset
    d_total_rotation = d_base_rotation + d_offset
    @total_rotation_array = [a_total_rotation, b_total_rotation, c_total_rotation, d_total_rotation]
  end

  def calculate_character_map
    current_index = 0
    current_encryption_map = @base_character_map.transform_values do
      expected_valuetobe_index = current_index + current_rotation
      while expected_valuetobe_index > 38
        expected_valuetobe_index -= 39
      end
      current_index += 1
      @base_character_map.values[expected_valuetobe_index]
    end
    current_encryption_map
  end


  def store_all_encryption_character_maps
    @encryption_character_maps = @total_rotation_array.map do |current_rotation|
      calculate_character_map
    end
  end

  def encrypt(my_message, key = @five_digit_key, date = @date_offset)


  end

  # def calculate_b_character_map
  #   current_rotation = @b_total_rotation
  #   current_index = 0
  #   current_encryption_map = @base_character_map.transform_values do
  #     expected_valuetobe_index = current_index + current_rotation
  #     while expected_valuetobe_index > 38
  #       expected_valuetobe_index -= 39
  #     end
  #     current_index += 1
  #     @base_character_map.values[expected_valuetobe_index]
  #   end
  #   current_encryption_map
  # end
  #
  # def calculate_c_character_map
  #   current_rotation = @c_total_rotation
  #   current_index = 0
  #   current_encryption_map = @base_character_map.transform_values do
  #     expected_valuetobe_index = current_index + current_rotation
  #     while expected_valuetobe_index > 38
  #       expected_valuetobe_index -= 39
  #     end
  #     current_index += 1
  #     @base_character_map.values[expected_valuetobe_index]
  #   end
  #   current_encryption_map
  # end
  #
  # def calculate_d_character_map
  #   current_rotation = @a_total_rotation
  #   current_index = 0
  #   current_encryption_map = @base_character_map.transform_values do
  #     expected_valuetobe_index = current_index + current_rotation
  #     while expected_valuetobe_index > 38
  #       expected_valuetobe_index -= 39
  #     end
  #     current_index += 1
  #     @base_character_map.values[expected_valuetobe_index]
  #   end
  #   current_encryption_map
  # end

  def decrypt
  end

  def crack
  end

  def create_shift
    #combine base_rotation and offset into [11, 22, 33, 44]
  end
end
