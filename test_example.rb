require 'watir-webdriver'


browsers = [:chrome, :firefox]

browsers.each do |b|
  browser = Watir::Browser.new(browser = b)
  puts "starting browser as #{browser}"
  browser.goto 'http://whatismybrowser.com'
  puts browser.div(:class => 'string-major').text
  browser.close
end