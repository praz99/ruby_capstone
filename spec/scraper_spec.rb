# rubocop:disable Metrics/LineLength

require 'nokogiri'
require 'httparty'
require_relative '../lib/scraper.rb'

describe Scraper do
  let(:scraper) { Scraper.new }
  context '#scrape' do
    it 'returns an array of hash' do
      expect(scraper.scrape[1]).to eql({ position: '2', country: 'Brazil', total_cases: '929,149', active_cases: '406,318', recovered: '477,364', deaths: '45,467' })
    end
  end
end
# rubocop:enable Metrics/LineLength
