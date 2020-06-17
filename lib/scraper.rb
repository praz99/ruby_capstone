require 'nokogiri'
require 'httparty'
require 'pry'
# require 'open-uri'

class Scraper

  def parse_url()
    page = HTTParty.get('https://www.worldometers.info/coronavirus/#countries')
    parse_page = Nokogiri::HTML(page)
  end
  
  def scrape
    parsed_page = parse_url()
    table = parsed_page.at('table')
    create_hash(table)
  end

  private
  def create_hash(new_hash)
    countries = []
    new_hash.css('tbody').css('tr')[8..222].each do |tr|
      data = {
        index: tr.css('td')[0].text,
        name: tr.css('td')[1].text.capitalize,
        total: tr.css('td')[2].text,
        active: tr.css('td')[8].text,
        recovered: tr.css('td')[6].text,
        deaths: tr.css('td')[4].text.strip
      }
      countries.push(data)
    end
    countries
  end
end

# scrap = Scraper.new
# scrap.scrape
