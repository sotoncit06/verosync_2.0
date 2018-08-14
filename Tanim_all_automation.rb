a=Time.now()
$LOAD_PATH << '.'

require 'require_files'


puts "Please enter the number of the following servers"
puts "1. 192.168.10.195\n2. 192.168.10.188\n"
i= Integer(gets.chomp)
if i==1
  server="http://192.168.10.106/sync"
  ip = "192.168.10.106"
elsif i==2
  server="http://192.168.10.188/sync"
  ip = "192.168.10.188"

elsif i==3
  server ="http://http:rupshav18/sync"
  ip= "192.168.10.106"

end
sleep 5


def setup(browsers, machine)
  Thread.current[:driver] = Selenium::WebDriver.for :remote, :url => "http://#{machine}:4444/wd/hub", :desired_capabilities => :"#{browsers}"
end

BROWSER = {firefox: 'localhost'} #,chrome: '192.168.10.230',internet_explorer: '192.168.10.174'}
threads=[]

BROWSER.each_pair do |browser, machine|
  threads << Thread.new do
    setup(browser, machine)
    domain='qa-server5'
    Thread.current[:driver].get "#{server}"
    # Thread.current[:driver].get "#{server}"

    user_creation(server, Thread.current[:driver], browser)
    folder_operations_details(server, Thread.current[:driver], browser)
    file_operations_details(server, Thread.current[:driver], browser)
    collaborator_operations(server, Thread.current[:driver], browser)
    contacts_operations_details(server, Thread.current[:driver], browser)
    view_reports(server, Thread.current[:driver], browser)
    trash_restore(server, Thread.current[:driver], browser)
    quota(server, Thread.current[:driver], browser)

    ###################################Tanim#########################################
  end
end
threads.each { |thread| thread.join }
