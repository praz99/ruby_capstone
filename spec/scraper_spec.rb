# rubocop:disable Metrics/LineLength

require 'nokogiri'
require 'httparty'
require_relative '../lib/scraper.rb'

describe Scraper do
  let(:scraper) { Scraper.new }
  context '#scrape' do
    it 'returns an array of hash' do
      expect(scraper.scrape[212]).to eql({ position: '213', country: 'Anguilla', total_cases: '3', active_cases: '0', recovered: '3', deaths: '' })
    end
  end
end
# rubocop:enable Metrics/LineLength
