require 'selenium-webdriver'

def bill_gates(message_endpoint)
  # caps = Selenium::WebDriver::Remote::Capabilities.new
  # caps["acceptInsecureCerts"] = true
  # driver = Selenium::WebDriver.for(:remote, url: "http://localhost:4444/wd/hub", desired_capabilities: :chrome)
  driver = Selenium::WebDriver.for(:chrome, desired_capabilities: :chrome)
  driver.navigate.to("http://BigBillyMoneyBags:21b341bf77e44006eeaecf446d4646c546d399792951b989a572ee6dc3240333@0.0.0.0:15123#{message_endpoint}")
  driver.manage.add_cookie(name: "flag", value: "DefinitelyNotFreddieVonChimpenheimer")
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
      "you should check out https://www.reddit.com/r/cookies",
      "that's nice, but https://www.bing.com/images/search?q=cookies"
  ]
  messages[rand(messages.length-1)]
end

Dir["cache/messages/*.txt"].each do |filename|
  Thread.new {
    f = File.open(filename, "r")
    bill_gates(f.read)
    f.close
    File.delete(filename)
  }.join
end
