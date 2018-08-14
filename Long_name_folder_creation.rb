a=Time.now()
$LOAD_PATH << '.'

require 'require_files'


#sleep 5
server="http://192.168.10.195/sync"

def setup(browsers, machine)
  Thread.current[:driver] = Selenium::WebDriver.for :remote, :url => "http://#{machine}:4444/wd/hub", :desired_capabilities => :"#{browsers}"
end

BROWSER = {chrome: 'localhost'} #,chrome: '192.168.10.230',internet_explorer: '192.168.10.174'}
threads=[]

BROWSER.each_pair do |browser, machine|
  threads << Thread.new do
    setup(browser, machine)
    domain='qa-server5'

    Thread.current[:driver].get "#{server}"

    ob=SignIn::UserSignIn.new
    ob.user_sign_in(server, Thread.current[:driver], "tanim1@nilavodev.com", "1")
    sleep 2

    for i in 1..11
      folder_name='1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789056789012345678901234567890123456789012345678901234567890'
      ob=FolderOperations::FolderOperationsDetails.new
      ob.folder_creation(server, Thread.current[:driver], folder_name)
      sleep 2

      ob=FolderOperations::FolderOperationsDetails.new
      ob.folder_select(server, Thread.current[:driver], folder_name)
      sleep 2
    end


    ob=SignOut::UserSignOut.new
    ob.sign_out(server, Thread.current[:driver])


  end
end
threads.each { |thread| thread.join }
b=Time.now()
puts "#{(b-a).to_s} s"
puts "#{((b-a)/60).to_s} m"
puts "#{((b-a)/3600).to_s} h"