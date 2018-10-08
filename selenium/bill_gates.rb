require 'selenium-webdriver'

def bill_gates(message_endpoint)
  caps = Selenium::WebDriver::Remote::Capabilities.new
  driver = Selenium::WebDriver.for(:chrome, desired_capabilities: caps)
  driver.navigate.to("http://BigBillyMoneyBags:21b341bf77e44006eeaecf446d4646c546d399792951b989a572ee6dc3240333@localhost:3000#{message_endpoint}")
  driver.manage.add_cookie(name: "flag", value: "BigBillyMoneyBags")
  sleep 1
  driver.find_element(id:"message_content").send_keys "Suh dude. I'm Selenium Bill."
  driver.find_element(xpath: "//input[@value='Create Message']").click
  driver.close
end

Dir["cache/messages/*.txt"].each do |filename|
  f = File.open(filename, "r")
  bill_gates(f.read)
  f.close
  File.delete(filename)
end