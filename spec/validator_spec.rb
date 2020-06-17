require_relative '../lib/validator.rb'

describe Validator do
  let(:validator) { Validator.new }
  describe '#choice_valid?' do
    it 'returns true if given number is equal to 1 or 2 or 3' do
      expect(validator.choice_valid?('1')).to eql(true)
    end

    it 'returns false if given number is not equal to 1 or 2 or 3.' do
      expect(validator.choice_valid?('5')).to eql(false)
    end
  end

  describe '#position_valid?' do
    it 'returns true if given position is in between 1 and 215' do
      expect(validator.position_valid?(100)).to eql(true)
    end

    it 'returns false if given position is not in between 1 and 215.' do
      expect(validator.choice_valid?(220)).to eql(false)
    end
  end
end
