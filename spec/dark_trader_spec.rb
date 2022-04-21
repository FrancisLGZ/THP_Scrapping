#CALLED REQUIRE
require_relative '../lib/dark_trader'

describe "the crypto scrapper method" do
  it "should return at least x crypto and BTC, ETH and YY inside" do
    expect(crypto_scrapper()).to_eq() #completer et tester s'il sort un hash
  end
end