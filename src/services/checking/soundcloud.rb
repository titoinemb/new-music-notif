# import sorbet-runtime for add typage in ruby
require 'sorbet-runtime'
# import httparty & nokogiri for scraping soundcloud
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
# function for the last music in artist channel on soundcloud
# @param the id of channel https://soundcloud.com/<the id of channel>
def soundcloud(id, libreWolf)
  # scraping information in artist page on soundcloud
  options = Selenium::WebDriver::Firefox::Options.new
  options.binary = libreWolf

  driver = Selenium::WebDriver.for :firefox, options: options

  url = "https://soundcloud.com/#{id}/tracks"
  driver.navigate.to url

  # the class name of the list of albulm/single title
  css_selector = '.sc-link-primary.soundTitle__title.sc-link-dark.sc-text-h4'

  waitForPageToLoad(driver, css_selector)

  html = driver.page_source
  parsed_page = Nokogiri::HTML(html)

  titles = parsed_page.css(css_selector)

  titles.each do |title|
    span_text = title.at_css('span')

    # close the browser
    driver.quit

    # return the last title name
    return span_text.text.strip
  end
end