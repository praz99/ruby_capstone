# frozen_string_literal: true

require 'nokogiri'
require 'httparty'
 require 'pry'
# require 'open-uri'

class Scraper
  attr_reader :country, :position, :url

  def initialize(country = nil, position = nil, url = nil)
    @country = country
    @position = position
    @url = url
  end

  def parse_url(url)
    page = HTTParty.get(url)
    parse_page = Nokogiri::HTML(page)
  end
  
  def scrape
    parsed_page = parse_url(@url)
    table = parsed_page.at('table')
    create_hash(table)
  end

  # def create_hash(new_hash)
  #   countries = []
  #   new_hash.css('tbody').css('tr')[8..-1].each do |tr|
  #     data = {
  #       index: tr.css('td')[0].text,
  #       name: tr.css('td')[1].text,
  #       total: tr.css('td')[2].text,
  #       active: tr.css('td')[7].text,
  #       recovered: tr.css('td')[6].text,
  #       deaths: tr.css('td')[4].text.strip
  #     }
  #     countries.push(data)
  #   end
  #   Pry.start(binding)
  # end
end

scrap = Scraper.new('','','https://www.worldometers.info/coronavirus/#countries')
scrap.scrape
