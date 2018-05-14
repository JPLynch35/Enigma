require 'lib/key'
require 'lib/offset'

class Enigma

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
                    "\\" => "\\",
                    "|" => "|"
                     }
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
    # creates the encryption character map for each rotation (set current rotation equal to a_total_rotation, then b_total_rotation, etc)
    current_index = 0
    current_encryption_map = @base_character_map.transform_values do
      expected_valuetobe_index = current_index + current_rotation
      while expected_valuetobe_index > 84
        expected_valuetobe_index -= 85
      end
      current_index += 1
      @base_character_map.values[expected_valuetobe_index]
    end
    current_encryption_map
  end

  def store_all_encryption_character_maps
    # runs through all rotations (a thru d) and calls upon calculate_character_map to create the character maps, stores all 4 in an array
    @encryption_character_maps = @total_rotation_array.map do |current_rotation|
      calculate_character_map
    end
  end

  def encrypt(my_message, key = @five_digit_key, date = @date_offset)
    my_message_array = my_message.chars
    encrypted_message = []
    my_message_array.each_with_index do |character, index|
      if index % 4 == 0
        encrypted_message << @encryption_character_maps[0][character]
      elsif index % 4 == 1
        encrypted_message << @encryption_character_maps[1][character]
      elsif index % 4 == 2
        encrypted_message << @encryption_character_maps[2][character]
      elsif index % 4 == 3
        encrypted_message << @encryption_character_maps[3][character]
      end
    end
    encrypted_message.join
  end

  def decrypt

  end

  def crack

  end

  def create_shift
    #combine base_rotation and offset into [11, 22, 33, 44]
  end
end
