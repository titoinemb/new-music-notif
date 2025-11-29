# import sorbet-runtime for add typage in ruby
require 'sorbet-runtime'
# import selenium-webdriver & nokogiri for scraping soundcloud
require 'selenium-webdriver'
require 'nokogiri'
# import wating full charged page function
require_relative '../../utils/scraping/waitForPageToLoad'

# activate signature in this function
extend T::Sig

# typage for this function
sig {
  params(url: String, libreWolf: String).returns(T::Boolean)
}
# function for verif if is a valid soundcloud url
# @param url        the url of soudcloud artist
# @param libreWolf  the librewolf executable path
# @return           boolean
def verifyingUrl_soundcloud?(url, libreWolf)
  regex = %r{\Ahttps://soundcloud\.com/[^/]+\z}
  
  if regex.match?(url)
    # scraping if is a error page for if artist existe 
    options = Selenium::WebDriver::Firefox::Options.new
    options.binary = libreWolf
    # open the browser in invisible
    options.add_argument('--headless')

    driver = Selenium::WebDriver.for :firefox, options: options

    driver.navigate.to url

    waitForPageToLoad(driver, ".sc-link-secondary")

    html = driver.page_source
    parsed_page = Nokogiri::HTML(html)

    error = parsed_page.css(".errorButtons")

    # close the browser
    driver.quit

    return error.empty?
  else 
    return false
  end
end