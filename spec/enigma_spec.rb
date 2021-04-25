require 'date'
require 'time'
require './lib/enigma'

RSpec.describe Enigma do
  context 'exists' do
    enigma = Enigma.new

    it 'is a enigma' do
      expect(enigma).to be_instance_of(Enigma)
    end
  end

  context 'can encrypt a message' do
    enigma = Enigma.new

    it 'has characters' do
      expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
      expect(enigma.alphabet).to eq(expected)
    end

    it 'has a encrypt method' do
      expected = {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                 }
      expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
    end

    it 'can encrypt with no date given' do
      expected = {
                  encryption: "jkdeqfohtrw",
                  key: "02715",
                  date: false
                 }
      expect(enigma.encrypt("hello world", "02715")).to eq(expected)
    end

    it 'can encrypt with no key and no date given' do
      expected = {
                  encryption: "imquphaxsti",
                  key: false,
                  date: false
                 }
      Enigma.any_instance.stub(:keys_encrypt_decrypt).and_return([1,2,3,4])
      expect(enigma.encrypt("hello world")).to eq(expected)
    end
  end

  context 'can decrypt a message' do
    enigma = Enigma.new

    it 'has a decrypt method' do
      expected =   {
                    decryption: "hello world",
                    key: "02715",
                    date: "040895"
                   }
      expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
    end

    it 'can decrypt a message with no date use today date instead' do
      expected = {
                  decryption: "hello world",
                  key: "02715",
                  date: false
                 }
      expect(enigma.decrypt("jkdeqfohtrw", "02715")).to eq(expected)
    end
  end
end
