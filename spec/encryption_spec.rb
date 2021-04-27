require 'date'
require 'time'
require './lib/encryption'

RSpec.describe Encryption do
  context 'exists' do
    encryption = Encryption.new

    it 'exists' do
      expect(encryption).to be_instance_of(Encryption)
    end

    it 'has characters' do
      expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
      expect(encryption.alphabet).to eq(expected)
    end
  end

  context 'can encrypt a message' do
    encryption = Encryption.new

    it 'has characters' do
      expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
      expect(encryption.alphabet).to eq(expected)
    end

    it 'has a encrypt method' do
      expected = {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                 }
      expect(encryption.encrypt("hello world", "02715", "040895")).to eq(expected)
    end

    it 'can encrypt with no date given' do
      expected = {
                  encryption: "jkifqftitra",
                  key: "02715",
                  date: false
                 }
      expect(encryption.encrypt("hello world", "02715", false)).to eq(expected)
    end

    it 'can encrypt with no key and no date given' do
      expected = {
                  encryption: "jirtqdbwtpj",
                  key: false,
                  date: false
                 }
      allow(encryption).to receive(:keys_encrypt_decrypt).and_return([1,2,3,4])
      allow(encryption).to receive(:date_encrypt).and_return([1,2,3,4])
      expect(encryption.encrypt("hello world", false, false)).to eq(expected)
    end
  end
end