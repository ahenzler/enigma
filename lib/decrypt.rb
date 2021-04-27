require './lib/enigma'

enigma = Enigma.new

reader = File.open(ARGV[0], "r")

message = reader.read

reader.close

decrypted_messages = enigma.decrypt(message, ARGV[2], ARGV[3])

writer = File.open(ARGV[1], "w")

writer.write(decrypted_messages[:decryption])

writer.close

puts "Created #{ARGV[1]} with #{decrypted_messages[:key]} key and #{decrypted_messages[:date]} date."