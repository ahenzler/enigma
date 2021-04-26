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
  end

end