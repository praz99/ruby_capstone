# frozen_string_literal: true

require 'nokogiri'
require 'httparty'
require 'pry'
require 'open-uri'

class Scraper
  attr_reader :country, :position, :url
  
  def initialize(country = nil, position = nil, url = nil)
    @country = country
    @position = position
    @url = url
  end
end
# page = HTTParty.get('https://www.worldometers.info/coronavirus/#countries')
# parse_page = Nokogiri::HTML(page)

# countries = []

# table = parse_page.at('table')
# table.css('tbody').css('tr').each do |tr|
#   total = tr.css('td')[5].text
#   countries.push(:total => total)
# end

# puts countries
