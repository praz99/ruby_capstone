require 'nokogiri'
require 'httparty'
require 'pry'

require_relative '../lib/validator.rb'
require_relative '../lib/search.rb'

validate = Validator.new
search = Search.new

puts "\t\t\t-----WELCOME-----\n"
puts "Here you can find the details of coronavirus COVID-19 cases of a country, territory, or conveyance.\n\n"
puts "Search by entering a COUNTRY NAME or POSITION or see the list for WHOLE WORLD.\n\n"

def show_data(input)
  puts "\n"
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
    puts "\t3 for list of WHOLE WORLD."
    choice = gets.chomp
  end
  case choice
  when '1'
    country = ''
    while country.empty?
      print 'Please enter the country name you want to search: '
      country = gets.chomp.capitalize
    end
    value = search.search_name(country)
    if value.class == String
      puts "\n\nCountry not found. Please make sure you entered the country name correctly."
    else
      show_data(value)
    end
  when '2'
    position = ''
    while position.empty?
      print 'Please enter the position you want to find a country about [1-215]: '
      position = gets.chomp
    end
    until validate.position_valid?(position)
      puts 'Please enter between 1 and 215 only.'
      position = gets.chomp
    end
    value = search.search_position(position.to_i)
    if value.empty?
      puts "\n\nCountry not found. Please make sure you entered number between 1 and 215."
    else
      show_data(value)
    end
  when '3'
    print 'Showing the details about COVID-19 infections for all countries and territories in world:'
    value = search.show_all
    value.each do |mini|
      puts "\n"
      show_data(mini)
    end
  end

  print 'Do you want to continue? (Y/N): '
  yes_no = gets.chomp.downcase
  until validate.try_again?(yes_no)
    print 'Y/N?: '
    yes_no = gets.chomp.downcase
  end

  program = yes_no == 'y'
  system 'clear' if program
end

puts "\n\n\t\t\t...THANK YOU..."
