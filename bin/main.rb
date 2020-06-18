require 'nokogiri'
require 'httparty'
require 'pry'

require_relative '../lib/validator.rb'
require_relative '../lib/search.rb'
require_relative '../lib/message.rb'

validate = Validator.new
search = Search.new
message = Message.new

puts message.welcome

def show_data(input)
  puts "\n"
  input.map do |key, val|
    puts "#{key}: #{val}"
  end
end
program = true
while program
  choice = ''
  until validate.choice_valid?(choice)
    puts message.enter_choice
    choice = gets.chomp
  end
  case choice
  when '1'
    country = ''
    while country.empty?
      print message.enter_country_name
      country = gets.chomp.capitalize
    end
    value = search.search_name(country)
    if value.class == String
      puts value
    else
      show_data(value)
    end
  when '2'
    position = ''
    while position.empty?
      print message.enter_position
      position = gets.chomp
    end
    until validate.position_valid?(position)
      print message.valid_position
      position = gets.chomp
    end
    value = search.search_position(position.to_i)
    show_data(value)
  when '3'
    print message.all_country
    value = search.show_all
    value.each do |mini|
      puts "\n"
      show_data(mini)
    end
  end

  print message.continue
  yes_no = gets.chomp.downcase
  until validate.try_again?(yes_no)
    print 'Y/N?: '
    yes_no = gets.chomp.downcase
  end

  program = yes_no == 'y'
  system 'clear' if program
end

puts message.thank
