# rubocop:disable Metrics/LineLength

require_relative '../lib/search.rb'

describe Search do
  let(:search) { Search.new }
  describe '#show_all' do
    it 'returns all values in the array of hash.' do
      expect(search.show_all).to include({ position: '213', country: 'Anguilla', total_cases: '3', active_cases: '0', recovered: '3', deaths: '' })
    end
  end

  describe '#search_position' do
    it 'returns single hash in the given position.' do
      expect(search.search_position(213)).to eql({ position: '213', country: 'Anguilla', total_cases: '3', active_cases: '0', recovered: '3', deaths: '' })
    end
  end

  describe '#search_name' do
    it 'returns single hash that matches the given country name.' do
      expect(search.search_name('Anguilla')).to eql({ position: '213', country: 'Anguilla', total_cases: '3', active_cases: '0', recovered: '3', deaths: '' })
    end
    it 'returns error message if no match found.' do
      expect(search.search_name('Panda')).to eql("\n\nCountry not found. Please make sure you entered the country name correctly.")
    end
  end
end

# rubocop:enable Metrics/LineLength
