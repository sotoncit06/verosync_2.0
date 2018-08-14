$LOAD_PATH << '.'

require 'require_files'
require 'rautomation'


#sleep 5
server="http://192.168.10.195/sync"
#@driver = Selenium::WebDriver.for :ie
#@driver = Selenium::WebDriver.for :firefox
def setup(browsers,machine)
  Thread.current[:driver] = Selenium::WebDriver.for :remote, :url => "http://#{machine}:4444/wd/hub", :desired_capabilities => :"#{browsers}"
end
BROWSER = {firefox: 'localhost'}#,chrome: '192.168.10.230',internet_explorer: '192.168.10.174'}
threads=[]

BROWSER.each_pair do |browser, machine|
  threads << Thread.new do
    setup(browser,machine)
    Thread.current[:driver].get "#{server}"

    ####fresh install
    # user='admin@verosync.com'
    # pass='admin'
    # home=Home::GoToHome.new
    #
    # ob=SignIn::UserSignIn.new
    # ob.user_sign_in(server,Thread.current[:driver],user,pass)
    # Thread.current[:driver].find_element(:name,"file" ).click
    #
    # window = RAutomation::Window.new(:title => /File Upload/i)
    # p window.exists? # => true
    # window.text_field(:class => "Edit", :index => 0).set "C:\\1000U_153D_STD_ENT.license"
    # button = window.button(:value => "&Open")
    # button.click
    # sleep 2
    #
    # Thread.current[:driver].find_element(:name,"name").send_keys("Tanim")
    # Thread.current[:driver].find_element(:name,"email").send_keys("tanim1@nilavodev.com")
    # Thread.current[:driver].find_element(:name,"password").send_keys("1234")
    # Thread.current[:driver].find_element(:name,"confirmPassword").send_keys("1234")

    user='tanim1@nilavodev.com'
    pass='1'
    home=Home::GoToHome.new

    ob=SignIn::UserSignIn.new
    ob.user_sign_in(server,Thread.current[:driver],user,pass)


    admin_email='admin@nilavodev.com'
    ob=SystemSettings::GeneralSettings.new
    ob.application(server,Thread.current[:driver],admin_email)

    sleep 2
    home.home_page(server,Thread.current[:driver])
    sleep 2
    ob=SignIn::UserSignIn.new
    ob.user_sign_in(server,Thread.current[:driver],user,pass)
    sleep 2

    ob=TOS::ActionOnTos.new
    ob.tos_accept(server,Thread.current[:driver])

    home.home_page(server,Thread.current[:driver])
    ob=SystemSettings::GeneralSettings.new

    home.home_page(server,Thread.current[:driver])
    ob=SystemSettings::GeneralSettings.new
    ob.email(server,Thread.current[:driver])

    home.home_page(server,Thread.current[:driver])
    ob.mobile(server,Thread.current[:driver])

    home.home_page(server,Thread.current[:driver])
    ob.encryption(server,Thread.current[:driver])

    home.home_page(server,Thread.current[:driver])
    ob.recaptcha(server,Thread.current[:driver])

    home.home_page(server,Thread.current[:driver])
    ob.version_retention(server,Thread.current[:driver])

    ob=SystemSettings::AuthenticationSettings.new
    home.home_page(server,Thread.current[:driver])
    ob.ad_authentication(server,Thread.current[:driver])

    home.home_page(server,Thread.current[:driver])
    ob.password(server,Thread.current[:driver])

    home.home_page(server,Thread.current[:driver])
    ob.auto_unlocking(server,Thread.current[:driver])

    ob=SystemSettings::CustomizationSettings.new
    ob.web_interface(server,Thread.current[:driver])

    home.home_page(server,Thread.current[:driver])
    ob.logo(server,Thread.current[:driver])

    # user_name='test22'
    # email='test22@mnilavod.com'
    # password='123456'
    # conf_pass='123456'
    # role='Sync'
    # ob=UserManagement::ManageUsers.new
    # ob.create_user(server,Thread.current[:driver],user_name,email,password,conf_pass,role)
    #
    # admin_email='admin@vero.com'
    # ob.email(server,Thread.current[:driver])
    # ob=SystemSettings::CustomizationSettings.new
    # ob.logo(server,Thread.current[:driver])
  end
end

threads.each { |thread| thread.join }