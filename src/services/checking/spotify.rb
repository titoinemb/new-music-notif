# import sorbet-runtime for add typage in ruby
require 'sorbet-runtime'
# import selenium-webdriver & nokogiri for scraping spotify
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
# function for the last music in artist channel on spotify
# @param id         the id of channel https://spotify.com/<the id of channel>
# @param librewolf  the librewolf executable path
# @return           the last name of albulm/single
def checking_spotify(id, libreWolf)
  # scraping information in artist page on spotify
  options = Selenium::WebDriver::Firefox::Options.new
  options.binary = libreWolf
  # open the browser in invisible
  options.add_argument('--headless')
  
  driver = Selenium::WebDriver.for :firefox, options: options

  url = "https://open.spotify.com/artist/#{id}/discography/all"
  driver.navigate.to url

  # the class name of the list of albulm/single title
  css_selector = 'span[class="e-91000-text encore-text-title-medium encore-internal-color-text-base tAFzDJjlr14lei2t_KYl"]'

  waitForPageToLoad(driver, css_selector)

  html = driver.page_source
  parsed_page = Nokogiri::HTML(html)

  titles = parsed_page.css(css_selector)

  titles.each do |title|
    span_text = title.at_css('a')

    # close the browser
    driver.quit

    # return the last title name
    return span_text.text.strip
  end
end