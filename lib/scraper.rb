class Scraper
  def parse_url()
    url = 'https://www.worldometers.info/coronavirus/#countries'
    page = HTTParty.get(url)
    parse_page = Nokogiri::HTML(page)
    parse_page
  end

  def scrape
    parsed_page = parse_url
    table = parsed_page.at('table')
    create_hash(table)
  end

  private

  def create_hash(new_hash)
    countries = []
    new_hash.css('tbody').css('tr')[8..222].each do |tr|
      data = {
        position: tr.css('td')[0].text,
        country: tr.css('td')[1].text.capitalize,
        total_cases: tr.css('td')[2].text,
        active_cases: tr.css('td')[8].text,
        recovered: tr.css('td')[6].text,
        deaths: tr.css('td')[4].text.strip
      }
      countries.push(data)
    end
    countries
  end
end
