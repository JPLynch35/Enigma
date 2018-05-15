require './lib/enigma'

input_variables = ARGV
encrypted_file = input_variables[0]
decrypted_file = input_variables[1]
encrypt_key = input_variables[2]
encrypt_date = input_variables[3]

e = Enigma.new

output = File.new("./text/" + decrypted_file, "w+")
File.new("./text/" + encrypted_file).each_line do |line|
  output.puts e.decrypt(line.chomp, encrypt_key, encrypt_date)
end

puts "Created 'decrypted.txt' with the key #{encrypt_key} and date #{encrypt_date}"
