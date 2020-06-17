require_relative '../lib/scraper.rb'

class Search < Scraper
  def show_all
    scrape
  end

  def search_position(pos)
    result = ''    
    scrape.each do |item|
      result = scrape[pos - 1] if item[:position] == pos.to_s
    end
    result
  end

  def search_name(name)
    temp = ''
    scrape.each do |item|
      temp = item[:position] if item[:country] == name
    end
    scrape[temp.to_i - 1]
  end
end
