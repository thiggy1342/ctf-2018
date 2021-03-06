require 'selenium-webdriver'

def bill_gates(message_endpoint, js_enabled=true, attempt=1)
  puts "Beginning Selenium browser session."
  begin
    chrome_opts = [ "--no-sandbox", "--headless", "--disable-gpu", "--window-size=1920x1080"]
    if !js_enabled
      chrome_opts.push('--disable-javascript')
    end
    caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => chrome_opts })
    driver = Selenium::WebDriver.for(:chrome, driver_path: "/usr/local/share/chromedriver", desired_capabilities: caps)
    # client = Selenium::WebDriver::Remote::Http::Default.new
    # client.read_timeout = 60
    # driver = Selenium::WebDriver.for(:remote, url: "http://localhost:4444/wd/hub", desired_capabilities: caps, http_client: client)
    driver.manage.timeouts.implicit_wait = 3
    driver.navigate.to("http://BigBillyMoneyBags:21b341bf77e44006eeaecf446d4646c546d399792951b989a572ee6dc3240333@192.168.0.1:15123#{message_endpoint}")
    driver.manage.add_cookie(name: "flag", value: "DefinitelyNotFreddieVonChimpenheimer")
    sleep 2
    driver.find_element(id:"message_content").send_keys get_message
    driver.find_element(xpath: "//input[@value='Create Message']").click
    driver.close
  rescue Exception => e
    puts "Unable to run Selenium Commands. Encountered Error: #{e.message}\n"
    if attempt < 2
      bill_gates(message_endpoint, false, 2)
    end
  end
end

def get_message
  messages = [
      "sry i've got like 42 tabs open in chrome rn",
      "i could really go for some cookies right about meow",
      "y tho",
      "http://lmgtfy.com/?s=k&q=how+do+I+mail+cookies",
      "pls send cookies",
      "oatmeal raisin, chocolate chip, snickerdoodle....any would do",
      "I    N  E  E  D    C  O  O  K  I  E  S",
      "you should check out https://www.reddit.com/r/cookies",
      "try and beat my high score, n00b http://fastfives.mailchimp.com/",
      "bc I look fly in cavendish, that's why!"
  ]
  messages[rand(messages.length-1)]
end

puts "Start of script run"

Dir[File.expand_path(File.dirname(__FILE__))+"/../cache/messages/*.txt"].each do |filename|
  # Thread.new {
    f = File.open(filename, "r")
    bill_gates(f.read)
    f.close
    File.delete(filename)
  # }.join
end

puts "end of script run"

