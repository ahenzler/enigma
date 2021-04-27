require 'date'
require 'time'
require './lib/decryption'

RSpec.describe Decryption do
  context 'exists' do
    decryption = Decryption.new

    it 'exists' do
      expect(decryption).to be_instance_of(Decryption)
    end

    it 'has characters' do
      expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
      expect(decryption.alphabet).to eq(expected)
    end
  end

  context 'has a way to decrypt a message' do
    decryption = Decryption.new

    it 'can a decrypt a message' do
      expected =   {
                    decryption: "hello world",
                    key: "02715",
                    date: "040895"
                   }
      expect(decryption.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
    end

    it 'can decrypt a message with no date use today date instead' do
      expected = {
                  decryption: "hello world",
                  key: "02715",
                  date: false
                 }
      expect(decryption.decrypt("jldiqgoltsw", "02715")).to eq(expected)
    end
  end
end