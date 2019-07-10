# XSS CTF Challenge

A mysterious chat with another random user. Be wary of the ability to send html to one another, the feature is still in beta.

## background

This CTF challenge is based around an XSS attack. The rails app is a chat client that connects you with a "random" user. You can send messages back and forth, including html elements if a certain option is enabled. The other "user" is a selenium script (selenium/bill_gates.rb) that runs on a cron. This loads up the chat client in a browser (which executes JS wink wink nudge nudge), and responds.
