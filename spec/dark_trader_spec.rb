#CALLED REQUIRE
require_relative '../lib/dark_trader'

#TEST METHODE CRYPTO#

describe "the crypto scrapper method" do
  it "should return an array with at least BTC and ETH inside" do
    expect(crypto_scrapper).to include("BTC")
  end
end
 

#TEST METHODE PRICES#

# describe "the prices scrapper method" do
#   it "should return array" do
#     expect(prices_scrapper(url)).to
#   end
# end


#TEST METHODE FINALE#

# describe "the final array method" do
#   it "should return array oh hash" do
#     expect(prices_scrapper(url)).to
#   end
# end