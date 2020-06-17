require './scraper'

class Search < Scraper
  def show_all()
    scrape
  end

  def search_position(pos)
    result = ''
    
    scrape.each do |item|
      result = scrape[pos-1] if item[:index] == pos.to_s
    end
    result
  end

  def search_name(name)
    result = ''
    temp = ''
    scrape.each do |item|
      temp = item[:index] if item[:name] == name
    end
    result = scrape[temp.to_i-1]
  end
end

# search = Search.new
# search.search_name("Germany")
# search.search_position(3)
