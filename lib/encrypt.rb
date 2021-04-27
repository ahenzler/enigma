require './lib/enigma'

enigma = Enigma.new

reader = File.open(ARGV[0], "r")

message = reader.read

reader.close

encrypted_messages = enigma.encrypt(message, "01234","140893")

writer = File.open(ARGV[1], "w")

writer.write(encrypted_messages[:encryption])

writer.close

puts "Created \'#{ARGV[0]}\' with the key #{encrypted_messages[:key]} and date #{encrypted_messages[:date]}."