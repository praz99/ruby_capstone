require 'nokogiri'
require 'httparty'
require 'pry'

require_relative '../lib/validator.rb'
require_relative '../lib/search.rb'

validate = Validator.new
search = Search.new

puts "---WELCOME---\n"
puts "Here you can find the details of coronavirus COVID-19 cases of a country, territory, or conveyance.\n\n"
puts "Search by entering a COUNTRY NAME or POSITION or see the list for whole world.\n\n"

def show_data(input)
  input.each do |key, val|
    puts "#{key}: #{val}"
  end
end
program = true
while program
  choice = ''
  until validate.choice_valid?(choice)
    puts 'Please enter'
    puts "\t1 for search by COUNTRY NAME."
    puts "\t2 for search by POSITION."
    puts "\t3 to list of WHOLE WORLD."
    choice = gets.chomp
  end
  case choice
  when '1'
    country = ''
    until country.nil?
      print 'Please enter the country name you want to search: '
      country = gets.chomp.capitalize
    end
    value = search.search_name(country)
    show_data(value)
  when '2'
    print 'Please enter the position you want to find a country about [1-215]: '
    position = gets.chomp.to_i
    value = search.search_position(position)
    # puts value
    show_data(value)
  when '3'
    print 'Showing the details about COVID-19 infections for all countries and territories in world:'
    value = search.show_all
    value.each do |mini|
      puts "\n"
      show_data(mini)
    end    
  end
  program = false
end
