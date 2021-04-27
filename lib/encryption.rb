class Encryption

  def alphabet
    characters = ("a".."z").to_a << " "
  end

  def shifted(key, date)
    shifted = keys_encrypt(key).zip(date_encrypt(date))
    combination = shifted.map do |shift|
      shift.sum
    end
  end

  def message_num(message)
    message_to_num(message)
  end

  def encrypt(message, key, date)
    message = message.downcase
    keys_encrypt(key)
    date_encrypt(date)
    shift = shifted(key, date)
    m_num = message_num(message)
    crypt = m_num.zip(shift.cycle).map(&:sum)
    encrypted = crypt.map do |char|
      alphabet[char%27]
    end
    hash_encryption = encrypted.join("")
    encryption = {encryption: hash_encryption, key: key, date: date}
  end

  def message_to_num(message)
    e_num = message.chars.map do |c|
      alphabet.index(c)
    end
  end

  def keys_encrypt(key)
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

  def date_encrypt(date)
    if date == false
      squared_nums = square_false_date(date)
    else
      squared_nums = square_date(date)
    end
     squared_nums
  end
end