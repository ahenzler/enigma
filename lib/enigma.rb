require './lib/encryption'
require './lib/decryption'

class Enigma

  def encrypt(message, key = false, date = false)
    cryption = Encryption.new
    cryption.encrypt(message, key, date)
  end

  def decrypt(message, key, date = false)
    cryption = Decryption.new
    cryption.decrypt(message, key, date)
  end



end