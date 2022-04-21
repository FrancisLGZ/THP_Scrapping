#GEMS REQUIRED#

require 'rubygems'
require 'rspec'
require 'pry'
require 'rubocop'
require 'dotenv'
require 'twitter'
require 'nokogiri'
require 'open-uri'

#GEMS REQUIRED#


#1- SCRAPPER LES SYMBOLS DES CRYPTO DANS UN ARRAY
#2- SCRAPPER LES PRIX DANS UN ARRAY
#3- FUSIONNER LES DEUX ARRAY EN UN HASH


page_url = "https://coinmarketcap.com/all/views/all/" 

def crypto_scrapper(url)

  crypto_array = []
  
  page = Nokogiri::HTML(URI.open(url))
  page.xpath('//td[@class ="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--hide-sm cmc-table__cell--sort-by__symbol"]').each do |crypto|

    crypto_array << crypto.text

  end

    return crypto_array

end

def prices_scrapper(url)

  prices_array = []
  
  page = Nokogiri::HTML(URI.open(url))
  page.xpath('//td[@class ="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]').each do |price|

    prices_array << price.text.delete("$,").to_f

  end

    return prices_array

end

# def final_array ()

final_array = []

final_hash = Hash[crypto_scrapper(page_url).zip(prices_scrapper(page_url))]

final_array.push(final_hash)

puts final_array.class

# end