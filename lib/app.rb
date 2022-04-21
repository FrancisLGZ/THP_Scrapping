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

page = Nokogiri::HTML(open("index.html"))   #Si la page du site est stockee en local
puts page.class   # => Nokogiri::HTML::Document

page = Nokogiri::HTML(open("http://en.wikipedia.org/"))   #Si la page est en ligne
puts page.class   # => Nokogiri::HTML::Document






#SELECTIONNER LES ELEMENTS VOULUS EN FONCTION DES SECTIONS CSS

PAGE_URL = "http://ruby.bastardsbook.com/files/hello-webpage.html"

page = Nokogiri::HTML(open(PAGE_URL))

puts page.css("title")[0].name   # => title # Ici cela retourne le nom de l'element. Par defaut cela ne retourne pas le contenu, le texte, il faut preciser.
puts page.css("title")[0].text   # => My webpage #En precisant ici text, cela retourne le contenu attendu. A noter aue Nokogiri retourne un Array ! D'ou les balises.
# Comme c'est un array, il faut specifier le rang de l'element, meme s'il y en a qu'un (ici on met [0] le premier element de l'array)

# set URL to point to where the page exists
page = Nokogiri::HTML(open(PAGE_URL))
links = page.css("a")
puts links.length   # => 6
puts links[0].text   # => Click here
puts links[0]["href"] # => http://www.google.com  

#Usigin SELECT for a collection


page = Nokogiri::HTML(open(PAGE_URL))
news_links = page.css("a").select{|link| link['data-category'] == "news"} #Recherche dans la page tous liens liens (a) et select dans l'array :
#link (variable que l'on defini)
news_links.each{|link| puts link['href'] }

#=>   http://reddit.com
#=>   http://www.nytimes.com
         
puts news_links.class   #=>   Array  

