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

#LIENS URL#

townhall_url = "https://www.annuaire-des-mairies.com/95/ableiges.html"

townhallS_url = "https://www.annuaire-des-mairies.com/val-d-oise.html"

#LIENS URL#

#METHODE 1 : GET EMAILS#

def get_townhall_email(url)

  townhall_email_array = []
  
  page = Nokogiri::HTML(URI.open(url))
  page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |email|

    townhall_email_array << email.text

  end

    return townhall_email_array

end

#METHODE 1 : GET EMAILS#



#METHODE 2 : GETS URLS FROM TOWNHALL

def get_townhall_url(url)

  townhall_url_array = []
  
  page = Nokogiri::HTML(URI.open(url))
  page.xpath('//a[contains(@href, "95")]').each do |link|

  townhall_url_array << "https://www.annuaire-des-mairies.com" + link['href'][1..-1]

  end

    return townhall_url_array

end


urldef = get_townhall_url(townhallS_url)

urldef.join(",")

puts get_townhall_email(urldef)

#METHODE 2 : GETS URLS FROM TOWNHALL

# townhall_url_array = get_townhall_url(townhallS_url)

# puts townhall_url_array.each do |link|

#   link = 
  
#   "https://www.annuaire-des-mairies.com#{link}"
# end