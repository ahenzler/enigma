require './lib/enigma'

handle = File.open(ARGV[0], "r")

message = handle.read

handle.close

encrypted_messages = enigma.encrypt(message, "01234","081493")

writer = File.open(ARGV[1], "w")

writer.write(encrypted_messages)

writer.close