# import sorbet-runtime for add typage in ruby
require 'sorbet-runtime'
# import selenium-webdriver & nokogiri for scraping youtube
require 'selenium-webdriver'
require 'nokogiri'
# import wating full charged page function
require_relative '../../utils/scraping/waitForPageToLoad'

# activate signature in this function
extend T::Sig

# typage for this function
sig {
  params(id: String, libreWolf: String).returns(String)
}
# function for the last music in artist channel on youtube
# @param id         the id of channel https://www.youtube.com/@<the id of channel> OR https://www.youtube.com/channel/<the id of channel>
# @param librewolf  the librewolf executable path
# @return           the last name of albulm/single
def checking_youtube()
  # scraping information in artist page on youtube
  options = Selenium::WebDriver::Firefox::Options.new
  options.binary = libreWolf
  # open the browser in invisible
  options.add_argument('--headless')

  driver = Selenium::WebDriver.for :firefox, options: options

  url = "https://www.youtube.com/@#{id}/releases"
  driver.navigate.to url
end