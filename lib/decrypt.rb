require './lib/enigma'

enigma = Enigma.new

reader = File.open(ARGV[0], "r")

message = reader.read

reader.close

decrypted_messages = enigma.decrypt(message, "01234","140893")

writer = File.open(ARGV[1], "w")

writer.write(decrypted_messages[:encryption])

writer.close

puts "Created #{ARGV[0]} with #{decrypted_messages[:key]} key and #{decrypted_messages[:date]} date."