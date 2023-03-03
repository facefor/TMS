require 'net/http'
require 'json'

uri = URI('https://api.chucknorris.io/jokes/categories')
response = Net::HTTP.get(uri)
categories = JSON.parse(response)

puts 'Выберите категорию шуток:'
categories.each_with_index { |category, index| puts "#{index + 1}. #{category}" }
chosen_category = categories[gets.to_i - 1]

uri = URI("https://api.chucknorris.io/jokes/random?category=#{chosen_category}")
response = Net::HTTP.get(uri)
joke = JSON.parse(response)['value']
puts joke