require 'selenium-webdriver'
# function for wait if the page is full charged
def waitForPageToLoad(driver, css_selector)
  wait = Selenium::WebDriver::Wait.new(timeout: 30)
  wait.until {
    driver.find_element(css: css_selector)
  }
end