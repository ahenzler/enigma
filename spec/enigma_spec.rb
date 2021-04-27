require 'date'
require 'time'
require './lib/encryption'
require './lib/decryption'
require './lib/enigma'

RSpec.describe Enigma do
  context 'exists' do
    enigma = Enigma.new

    it 'is a enigma' do
      expect(enigma).to be_instance_of(Enigma)
    end

    it 'has attributes' do
      expected1 = {:date=>"260421", :encryption=>"eccktep", :key=>"12345"}
      expected2 = {:date=>"260421", :decryption=>"message", :key=>"12345"}
      expect(enigma.encrypt("message","12345", "260421")).to eq(expected1)
      expect(enigma.decrypt("eccktep","12345", "260421")).to eq(expected2)
    end
  end

end