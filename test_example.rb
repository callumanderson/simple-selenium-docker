require 'watir-webdriver'

browsers = [:chrome, :firefox]


def get_browser(capabilities, name, ip)
  capabilities.browser_name = name
  browser = Watir::Browser.new(
      :remote,
      :url => "http://#{ip}:4444/wd/hub",
      :desired_capabilities => capabilities
  )
  browser
end

browsers.each do |b|
  ip = URI.parse(`boot2docker ip`)
  capabilities = Selenium::WebDriver::Remote::Capabilities.new
  browser = get_browser(capabilities, b, ip)


  puts "starting browser as #{browser}"
  browser.goto 'http://whatismybrowser.com'
  puts browser.div(:class => 'string-major').text
  browser.close

end
