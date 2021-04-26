require './lib/enigma'
enigma = Enigma.new

handle = File.open(ARGV[0], "r")

message = handle.read

handle.close

encrypted_messages = enigma.encrypt(message, "01234","140893")

writer = File.open(ARGV[1], "w")

writer.write(encrypted_messages)

writer.close