$LOAD_PATH << '.'

require 'require_files'

puts "Please enter the number of the following servers"
puts "1. 192.168.10.195\n2. 192.168.10.188\n"
i= Integer(gets.chomp)
if i==1
  server="http://192.168.10.195/sync"
  ip = "192.168.10.195"
elsif i==2
  server="http://192.168.10.188/sync"
  ip = "192.168.10.188"

end
sleep 5

def setup(browsers, machine)
  Thread.current[:driver] = Selenium::WebDriver.for :remote, :url => "http://#{machine}:4444/wd/hub", :desired_capabilities => :"#{browsers}"
end

BROWSER = {firefox: 'localhost'}
#,chrome: '192.168.10.230',internet_explorer: '192.168.10.174'}
threads=[]

BROWSER.each_pair do |browser, machine|
  threads << Thread.new do
    setup(browser, machine)
    domain='qa-server5'


=begin
    ob=SignIn::UserSignIn.new
    ob.user_signin(server,Thread.current[:driver],"sarja1@nilavodev.com","1234")
    sleep 2
    ob=SignOut::UserSignOut.new
    ob.sign_out(server,Thread.current[:driver])
=end

    ob=Email::EmailAccess.new
    ob.get_link(Thread.current[:driver], "sarja2", "1234", ip)


  end
end
threads.each { |thread| thread.join }
