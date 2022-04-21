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
#4- FAIRE UN ARRAY OU CHAQUE COUPLE CRYPTO/PRIX = UN HASH


page_url = "https://coinmarketcap.com/all/views/all/" 


#METHODE CRYPTO#

def crypto_scrapper(url)

  crypto_array = []
  
  page = Nokogiri::HTML(URI.open(url))
  page.xpath('//td[@class ="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--hide-sm cmc-table__cell--sort-by__symbol"]').each do |crypto|

    crypto_array << crypto.text

  end

    return crypto_array

end



#METHODE PRIX#

def prices_scrapper(url)

  prices_array = []
  
  page = Nokogiri::HTML(URI.open(url))
  page.xpath('//td[@class ="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]').each do |price|

    prices_array << price.text.delete("$,").to_f

  end

    return prices_array

end


#METHODE FUSION ARRAY > HASH > ARRAY COMPOSE DE HASHS#


def final_array(url)

  final_array = []

  final_hash = Hash[crypto_scrapper(url).zip(prices_scrapper(url))]

  final_hash.map {|hash| {hash[0] => hash[1]}}

    return final_hash

end

puts final_array(page_url)