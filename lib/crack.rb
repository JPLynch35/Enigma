require './lib/enigma'

input_variables = ARGV
encrypted_file = input_variables[0]
cracked_file = input_variables[1]
encrypt_date = input_variables[2]

e = Enigma.new

output = File.new("./text/" + cracked_file, "w+")
File.new("./text/" + encrypted_file).each_line do |line|
  output.puts e.crack(line, encrypt_date)
end

puts "Created 'decrypted.txt' with the key #{e.encrypt_key} and date #{encrypt_date}"
