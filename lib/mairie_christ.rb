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


#METHODE 2 : GETS URLS FROM TOWNHALL

urldef = get_townhall_url(townhallS_url)

#puts urldef

final_emails = []

urldef.each do |email_def|
  pages = Nokogiri::HTML(URI.open(email_def))
  pages.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |email|

    final_emails << email.text
  end
end

puts final_emails