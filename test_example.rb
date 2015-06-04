require 'watir-webdriver'


browsers = [:chrome, :firefox]

browsers.each do |b|
  capabilities = Selenium::WebDriver::Remote::Capabilities.new
  ip = URI.parse(`boot2docker ip`)


  capabilities.browser_name = b

  browser = Watir::Browser.new(
      :remote,
      :url => "http://#{ip}:4444/wd/hub",
      :desired_capabilities => capabilities
  )

  puts "starting browser as #{browser}"
  browser.goto 'http://whatismybrowser.com'
  puts browser.div(:class => 'string-major').text
  browser.close
end