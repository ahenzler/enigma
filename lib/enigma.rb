class Enigma
  attr_reader :encrypt_keys,
              :decrypt_keys

  def initialize
    @encrypt_keys = []
    @decrypt_keys = []
  end

  def alphabet
    characters = ("a".."z").to_a << " "
  end

  def encrypt(message, key, date = false)
    keys_encrypt(key)
    date_encrypt(date)
    shifted = keys_encrypt(key).zip(date_encrypt(date))
    combination = shifted.map do |shift|
      shift.sum
    end
    m_num = message_to_num(message)
    crypt = m_num.zip(combination.cycle).map(&:sum)
    encrypt = crypt.map do |char|
      alphabet[char%27]
    end
    hash_encryption = encrypt.join("")
    h = {encryption: hash_encryption, key: key, date: date}
  end

  def message_to_num(message)
    e_num = message.chars.map do |c|
      alphabet.index(c)
    end
  end

  def keys_encrypt(key)
    key1 = key.chars
    a1 = []
    key1.each_cons(2) do |a|
      a1 << a
    end
    @keys = a1.map do |index|
      index.join("").to_i
    end
  end

  def date_encrypt(date)
    if date == false
      date = Time.now.to_datetime
      today = date.strftime("%d/%m/%Y")
      square = today.to_i**2
      square = square.to_s
      if square.size < 4
        square = square.rjust(4,"0")
      end
      square_string = square.chars.last(4)
      square = square_string.map do |integer|
        integer.to_i
      end
    else
      square = date.to_i**2
      square = square.to_s
      if square.size < 4
        square = square.rjust(4,0)
      end
      square_string = square.chars.last(4)
      square = square_string.map do |integer|
        integer.to_i
      end
    end
    square
  end
#####################################################
  def decrypt(encrypted_message, key, date)
    keys_encrypt(key)
    date_encrypt(date)
    shifted = keys_encrypt(key).zip(date_encrypt(date))
    combination = shifted.map do |shift|
      shift.sum
    end
    negative_combo = combination.map do |shift|
      shift * -1
    end
    e_num = encrypted_message_to_num(encrypted_message)
    crypt = e_num.zip(negative_combo.cycle).map(&:sum)
    decrypt = crypt.map do |char|
      alphabet[char%27]
    end
    hash_decryption = decrypt.join("")
    h = {decryption: hash_decryption, key: key, date: date}
  end

  def encrypted_message_to_num(message)
        message.chars.map do |c|
      alphabet.index(c)
    end
  end
end