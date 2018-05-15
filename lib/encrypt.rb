require './lib/enigma'

input_variables = ARGV
message_file = input_variables[0]
encrypted_file = input_variables[1]

e = Enigma.new

output = File.new("./text/" + encrypted_file, "w+")
File.new("./text/" + message_file).each_line do |line|
  output.puts e.encrypt(line.chomp)
end

puts "Created 'encrypted.txt' with the key #{e.encrypt_key} and date #{e.encrypt_date}"
