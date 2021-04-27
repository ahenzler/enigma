class Decryption

  def alphabet
    characters = ("a".."z").to_a << " "
  end

  def shifted(key, date)
    shifted = keys_decrypt(key).zip(date_decrypt(date))
    combination = shifted.map do |shift|
      shift.sum
    end
    negative_combo = combination.map do |shift|
      shift * -1
    end
  end

  def decrypt(encrypted_message, key, date = false)
    encrypted_message = encrypted_message.downcase
    keys_decrypt(key)
    date_decrypt(date)
    negative_shift = shifted(key, date)
    e_num = decrypted_message_to_num(encrypted_message)
    crypt = e_num.zip(negative_shift.cycle).map(&:sum)
    decrypted = crypt.map do |char|
      alphabet[char%27]
    end
    hash_decryption = decrypted.join("")
    decryption = {decryption: hash_decryption, key: key, date: date}
  end

  def decrypted_message_to_num(message)
        message.chars.map do |c|
      alphabet.index(c)
    end
  end

  def keys_decrypt(key)
    if key == false
      key = rand(-100000).to_s
      new_key_array = key.chars
      new_key = []
      new_key_array.each_cons(2) do |a|
        new_key << a
      end
    else
      new_key_array = key.chars
      new_key = []
      new_key_array.each_cons(2) do |a|
        new_key << a
      end
    end
    keys = new_key.map do |index|
      index.join("").to_i
    end
  end

  def square_false_date(date)
    date = Time.now.to_datetime
    today = date.strftime("%d/%m/%Y")
    square = today.to_i**2
    square = square.to_s
    if square.size < 4
      square = square.rjust(4,"0")
    end
    square_string = square.chars.last(4)
    squared_nums = square_string.map do |integer|
      integer.to_i
    end
  end

  def square_date(date)
    square = date.to_i**2
    square = square.to_s
    if square.size < 4
      square = square.rjust(4,0)
    end
    square_string = square.chars.last(4)
    squared_nums = square_string.map do |integer|
      integer.to_i
    end
  end

  def date_decrypt(date)
    if date == false
      squared_nums = square_false_date(date)
    else
      squared_nums = square_date(date)
    end
     squared_nums
  end
end