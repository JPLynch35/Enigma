require './lib/key'
require './lib/offset'

class Enigma
  attr_reader :encrypt_key,
              :encrypt_date

  def initialize
    @base_character_map = {
                    "A" => "A",
                    "B" => "B",
                    "C" => "C",
                    "D" => "D",
                    "E" => "E",
                    "F" => "F",
                    "G" => "G",
                    "H" => "H",
                    "I" => "I",
                    "J" => "J",
                    "K" => "K",
                    "L" => "L",
                    "M" => "M",
                    "N" => "N",
                    "O" => "O",
                    "P" => "P",
                    "Q" => "Q",
                    "R" => "R",
                    "S" => "S",
                    "T" => "T",
                    "U" => "U",
                    "V" => "V",
                    "W" => "W",
                    "X" => "X",
                    "Y" => "Y",
                    "Z" => "Z",
                    "a" => "a",
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
                    "," => ",",
                    "!" => "!",
                    "@" => "@",
                    "#" => "#",
                    "$" => "$",
                    "%" => "%",
                    "^" => "^",
                    "&" => "&",
                    "*" => "*",
                    "(" => "(",
                    ")" => ")",
                    "[" => "[",
                    "]" => "]",
                    "<" => "<",
                    ">" => ">",
                    ";" => ";",
                    ":" => ":",
                    "/" => "/",
                    "?" => "?",
                    "|" => "|"
                    }
  end

  def encrypt(my_message, encrypt_key = 'random', encrypt_date = 'today')
    key_for_code = Key.new(encrypt_key)
    base_rotation_array = key_for_code.calculate_base_rotation
    @encrypt_key = key_for_code.key
    offset_for_code = Offset.new(encrypt_date)
    offset_array = offset_for_code.calculate_offset
    @encrypt_date = offset_for_code.date_number
    total_rotation_array = calculate_total_rotations(base_rotation_array, offset_array)
    create_all_character_map_creations(total_rotation_array)
    rotate_message(my_message)
  end

  def calculate_total_rotations(base_rotation_array, offset_array)
    a_total_rotation = base_rotation_array[0] + offset_array[0]
    b_total_rotation = base_rotation_array[1] + offset_array[1]
    c_total_rotation = base_rotation_array[2] + offset_array[2]
    d_total_rotation = base_rotation_array[3] + offset_array[3]
    return [a_total_rotation, b_total_rotation, c_total_rotation, d_total_rotation]
  end

  def create_all_character_map_creations(total_rotation_array)
    @encryption_character_maps = total_rotation_array.map do |current_rotation|
      calculate_single_character_map(current_rotation)
    end
  end

  def calculate_single_character_map(current_rotation)
    @base_character_map.transform_values.with_index do |current_value, current_index|
      value_to_be_index = current_index + current_rotation
      while value_to_be_index > 83
        value_to_be_index -= 84
      end
      @base_character_map.values[value_to_be_index]
    end
  end

  def utilize_correct_character_map(character, index, message)
    if index % 4 == 0
      message << @encryption_character_maps[0][character]
    elsif index % 4 == 1
      message << @encryption_character_maps[1][character]
    elsif index % 4 == 2
      message << @encryption_character_maps[2][character]
    elsif index % 4 == 3
      message << @encryption_character_maps[3][character]
    end
  end

  def rotate_message(my_message)
    message = []
    my_message_array = my_message.chars
    my_message_array.each_with_index do |character, index|
      utilize_correct_character_map(character, index, message)
    end
    message.join
  end

  def decrypt(output, encrypt_key, encrypt_date = 'today')
    key_for_code = Key.new(encrypt_key)
    base_rotation_array = key_for_code.calculate_base_rotation
    offset_for_code = Offset.new(encrypt_date)
    offset_array = offset_for_code.calculate_offset
    total_rotation_array = calculate_total_rotations(base_rotation_array, offset_array)
    create_all_character_map_creations_for_decrypt_crack(total_rotation_array)
    rotate_message(output)
  end

  def crack(output, encrypt_date = 'today')
    offset_for_code = Offset.new(encrypt_date)
    offset_array = offset_for_code.calculate_offset
    total_rotation_1 = crack_rotation_1(output)
    total_rotation_2 = crack_rotation_2(output)
    total_rotation_3 = crack_rotation_3(output)
    total_rotation_4 = crack_rotation_4(output)
    total_rotation_array = select_rotation_for_last_symbol(output, total_rotation_1, total_rotation_2, total_rotation_3, total_rotation_4)
    create_all_character_map_creations_for_decrypt_crack(total_rotation_array)
    base_rotation_array = calculate_crack_base_rotation_array(offset_array, total_rotation_array)
    caculate_5_digit_key(base_rotation_array)
    rotate_message(output)
  end

  def crack_rotation_1(output)
    index_of_1_period = @base_character_map.keys.index(".")
    encrypted_letter_for_1_period = output.chars[-1]
    index_of_1_encrypted_letter = @base_character_map.keys.index(encrypted_letter_for_1_period)
    total_rotation_1 = index_of_1_encrypted_letter - index_of_1_period
    if total_rotation_1 < 0
      total_rotation_1 += 84
    end
    return total_rotation_1
  end

  def crack_rotation_2(output)
    index_of_2_period = @base_character_map.keys.index(".")
    encrypted_letter_for_2_period = output.chars[-2]
    index_of_2_encrypted_letter = @base_character_map.keys.index(encrypted_letter_for_2_period)
    total_rotation_2 = index_of_2_encrypted_letter - index_of_2_period
    if total_rotation_2 < 0
      total_rotation_2 += 84
    end
    return total_rotation_2
  end

  def crack_rotation_3(output)
    index_of_3_d = @base_character_map.keys.index("d")
    encrypted_letter_for_3_d = output.chars[-3]
    index_of_3_encrypted_letter = @base_character_map.keys.index(encrypted_letter_for_3_d)
    total_rotation_3 = index_of_3_encrypted_letter - index_of_3_d
    if total_rotation_3 < 0
      total_rotation_3 += 84
    end
    return total_rotation_3
  end

  def crack_rotation_4(output)
    index_of_4_n = @base_character_map.keys.index("n")
    encrypted_letter_for_4_n = output.chars[-4]
    index_of_4_encrypted_letter = @base_character_map.keys.index(encrypted_letter_for_4_n)
    total_rotation_4 = index_of_4_encrypted_letter - index_of_4_n
    if total_rotation_4 < 0
      total_rotation_4 += 84
    end
    return total_rotation_4
  end

  def select_rotation_for_last_symbol(output, total_rotation_1, total_rotation_2, total_rotation_3, total_rotation_4)
    sort_rotation_array = [total_rotation_4, total_rotation_3, total_rotation_2, total_rotation_1]
    remainder = output.chars.length % 4
    if remainder == 1
      sort_rotation_array.rotate!.rotate!.rotate!
    elsif remainder == 2
      sort_rotation_array.rotate!.rotate!
    elsif remainder == 3
      sort_rotation_array.rotate!
    end
    return sort_rotation_array
  end

  def create_all_character_map_creations_for_decrypt_crack(total_rotation_array)
    @encryption_character_maps = total_rotation_array.map do |current_rotation|
      calculate_single_character_map_for_decrypt_crack(current_rotation)
    end
  end

  def calculate_single_character_map_for_decrypt_crack(current_rotation)
    @base_character_map.transform_values.with_index do |current_value, current_index|
      value_to_be_index = current_index - current_rotation
      while value_to_be_index < 0
        value_to_be_index += 84
      end
      @base_character_map.values[value_to_be_index]
    end
  end

  def calculate_crack_base_rotation_array(offset_array, total_rotation_array)
    total_rotation_array.map.with_index do |rotation, i|
      rotation - offset_array[i]
    end
  end

  def caculate_5_digit_key(base_rotation_array)
    combined_array = base_rotation_array.join
    if combined_array[1] == combined_array[2] && combined_array[3] == combined_array[4] && combined_array[5] == combined_array[6]
      @encrypt_key = combined_array[0] + combined_array[1] + combined_array[3] + combined_array[5] + combined_array[7]
    else
      combined_array = check_base_rotation_array_for_single_digits(base_rotation_array).join
      @encrypt_key = combined_array[0] + combined_array[1] + combined_array[3] + combined_array[5] + combined_array[7]
    end
  end

  def check_base_rotation_array_for_single_digits(base_rotation_array)
    corrected_base_rotation_array = base_rotation_array.map do |rotation|
      if rotation.to_s.length == 1
        "0" + rotation.to_s
      else
        rotation.to_s
      end
    end
    return corrected_base_rotation_array
  end

end
