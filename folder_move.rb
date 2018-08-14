$LOAD_PATH << '.'

require 'require_files'


#sleep 5
server="http://192.168.10.195/sync"
#@driver = Selenium::WebDriver.for :ie
#@driver = Selenium::WebDriver.for :firefox
def setup(browsers, machine)
  Thread.current[:driver] = Selenium::WebDriver.for :remote, :url => "http://#{machine}:4444/wd/hub", :desired_capabilities => :"#{browsers}"
end

BROWSER = {firefox: 'localhost'} #,chrome: '192.168.10.230',internet_explorer: '192.168.10.174'}
threads=[]

BROWSER.each_pair do |browser, machine|
  threads << Thread.new do
    setup(browser, machine)

    user_name='sakib1@nilavodev.com'
    password='1234'
    ob=SignIn::UserSignIn.new
    ob.user_sign_in(server, Thread.current[:driver], user_name, password)

    folder_name='Shared Folder 1'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_creation(server, Thread.current[:driver], folder_name)

    Thread.current[:driver].navigate.refresh
    folder_name='Folder A'
    ob.folder_creation(server, Thread.current[:driver], folder_name)

    Thread.current[:driver].navigate.refresh
    folder_name='Shared Folder B'
    ob.folder_creation(server, Thread.current[:driver], folder_name)

    ob.folder_select(server, Thread.current[:driver], folder_name)
  end
end

threads.each { |thread| thread.join }