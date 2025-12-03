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
  params(url: String, libreWolf: String).returns(T::Boolean)
}
# function for verif if is a valid spotify url
# @param url        the url of soudcloud artist
# @param libreWolf  the librewolf executable path
# @return           boolean
def verifyingUrl_spotify?(url, libreWolf)
  # check if is a valide base url
  regex = %r{\Ahttps://open\.spotify\.com/artist/[^/]+\z}
  
  if regex.match?(url)
    # scraping if is a error page for if artist existe
    options = Selenium::WebDriver::Firefox::Options.new
    options.binary = libreWolf
    # open the browser in invisible
    options.add_argument('--headless')

    driver = Selenium::WebDriver.for :firefox, options: options

    driver.navigate.to url

    # Wait until the page finishes loading
    wait = Selenium::WebDriver::Wait.new(timeout: 30)
    wait.until {
      driver.execute_script('return document.readyState') == 'complete'
    }

    # Wait the moment of loading svg animation is destroy
    
    wait.until {
      driver.find_elements(css: ".jM1dnq2_qjViaXxa6WD7").empty?
    }

    html = driver.page_source
    parsed_page = Nokogiri::HTML(html)

    error = parsed_page.css("p[class='e-91000-text encore-text-title-medium']")

    # close the browser
    driver.quit

    return error.empty?
  else 
    return false
  end
end