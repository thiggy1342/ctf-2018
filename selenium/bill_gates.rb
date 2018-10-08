require 'selenium-webdriver'

def bill_gates(message_endpoint)
  caps = Selenium::WebDriver::Remote::Capabilities.new
  driver = Selenium::WebDriver.for(:chrome, desired_capabilities: caps)
  driver.navigate.to("http://BigBillyMoneyBags:21b341bf77e44006eeaecf446d4646c546d399792951b989a572ee6dc3240333@localhost:3000#{message_endpoint}")
  driver.manage.add_cookie(name: "flag", value: "BigBillyMoneyBags")
  sleep 1
  driver.find_element(id:"message_content").send_keys get_message
  driver.find_element(xpath: "//input[@value='Create Message']").click
  driver.close
end

def get_message
  messages = [
      "sry i've got like 42 tabs open in edge rn",
      "i could really go for some cookies right about meow",
      "y tho",
      "let me bing that for you...",
      "pls send cookies",
      "oatmeal raisin, chocolate chip, snickerdoodle....any would do",
      "C  O  O  K  I  E  S",
      "https://www.reddit.com/r/cookies",
      "https://www.bing.com/images/search?q=cookies"
  ]
  messages[rand(messages.length-1)]
end

Dir["cache/messages/*.txt"].each do |filename|
  f = File.open(filename, "r")
  bill_gates(f.read)
  f.close
  File.delete(filename)
end