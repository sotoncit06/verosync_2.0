$LOAD_PATH << '.'

require 'require_files'


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
    ip="192.168.10.195"
    Thread.current[:driver].get "#{server}"

    home=Home::GoToHome.new

    user_name='tanim1@nilavodev.com'
    password='1'
    ob=SignIn::UserSignIn.new
    ob.user_sign_in(server,Thread.current[:driver],user_name,password)
# =begin
#     ob=SystemSettings::CustomizationSettings.new
#     ob.web_interface(server,Thread.current[:driver])
#
#
#     user_name='sarja1'
#     rename='sarja2'
#     current_pass='1234'
#     new_pass='2345'
#     conf_pass='2345'
#     ob=UserProfile::Profile.new
#     ob.change_password(server,Thread.current[:driver],current_pass,new_pass,conf_pass)
#     =end
    url=Thread.current[:driver].current_url.to_s
    if url=="http://#{server}/sync/tos"
      sleep 2
      p
      ob=TOS::ActionOnTos.new
      ob.tos_accept(server,Thread.current[:driver])

    else

      ob=SystemSettings::AuthenticationSettings.new
      ob.ad_authentication(server,Thread.current[:driver])

      ob=SignOut::UserSignOut.new
      ob.sign_out(server,Thread.current[:driver])

      user_name='user_s@qa-server5.com'
      password='1234'
      ob=SignIn::UserSignIn.new
      ob.user_sign_in(server,Thread.current[:driver],user_name,password)
      sleep 2

       folder_name='Folder1'
      ob=FolderOperations::FolderOperationsDetails.new
      ob.folder_creation(server,Thread.current[:driver],folder_name)

      home.home_page(server,Thread.current[:driver])
      folder_name='Folder2'
      ob.folder_creation(server,Thread.current[:driver],folder_name)

      home.search_in_home(server,Thread.current[:driver],folder_name)
      home.home_page(server,Thread.current[:driver])
      folder_name='Folder3'
      ob.folder_creation(server,Thread.current[:driver],folder_name)

      home.home_page(server,Thread.current[:driver])
      folder_name='Sent Links Test'
      ob.folder_creation(server,Thread.current[:driver],folder_name)

      home.home_page(server,Thread.current[:driver])
      folder_name='Sent Links Test 2'
      ob.folder_creation(server,Thread.current[:driver],folder_name)

      home.home_page(server,Thread.current[:driver])

      folder_name='Folder1'
      recipient_one='user_r@qa-server5.com'
      recipient_two='user_rs@qa-server5.com'
      ob.folder_share_multiple_user(server,Thread.current[:driver],folder_name,recipient_one,recipient_two)
      #ob.folder_share(server,Thread.current[:driver],folder_name,recipient)

      file_name='C:\test.txt'
      ob=FileOperations::FileOperationsDetails.new
      ob.file_upload(server,Thread.current[:driver],file_name)

      home.home_page(server,Thread.current[:driver])

      folder_name='Folder2'
      recipient_one='user_rs@qa-server5.com'
      ob=FolderOperations::FolderOperationsDetails.new
      ob.folder_share(server,Thread.current[:driver],folder_name,recipient_one)
      # #ob.folder_share(server,Thread.current[:driver],folder_name,recipient)

      file_name='C:\test1.txt'
      ob=FileOperations::FileOperationsDetails.new
      ob.file_upload(server,Thread.current[:driver],file_name)

      home.home_page(server,Thread.current[:driver])
      folder_name='Folder3'
      recipient_one='sakib4@nilavodev.com'
      ob=FolderOperations::FolderOperationsDetails.new
      ob.folder_share(server,Thread.current[:driver],folder_name,recipient_one)

      file_name='C:\test1.txt'
      ob=FileOperations::FileOperationsDetails.new
      ob.file_upload(server,Thread.current[:driver],file_name)

      home.home_page(server,Thread.current[:driver])
      folder_name='Sent Links Test'
      recipient='user_r@qa-server5.com'
      ob=FolderOperations::FolderOperationsDetails.new
      ob.folder_sent_link_add_file(server,Thread.current[:driver], folder_name, recipient)
      #ob.folder_sent_link(server, Thread.current[:driver],folder_name,recipient)
      #ob.folder_delete(server, Thread.current[:driver],folder_name)

      home.home_page(server,Thread.current[:driver])
      folder_name='Sent Links Test 2'
      rename_folder='Sent Links Test Renamed'
      recipient='user_rs@qa-server5.com'
      ob=FolderOperations::FolderOperationsDetails.new
      ob.folder_rename(server,Thread.current[:driver],folder_name,rename_folder)
      ob.folder_sent_link_add_file(server,Thread.current[:driver], rename_folder, recipient)

      ob=SignOut::UserSignOut.new
      ob.sign_out(server,Thread.current[:driver])

      user_name='user_rs@qa-server5.com'
      password='1234'
      ob=SignIn::UserSignIn.new
      ob.user_sign_in(server,Thread.current[:driver],user_name,password)

      ob=Notification::NotificationBell.new
      ob.notification_bell_click(server,Thread.current[:driver])

      ob.notification_bell_click_accept(server,Thread.current[:driver])

      ob=Notification::SharingNotificationBell.new
      ob.sharing_notification_envelop_click(server,Thread.current[:driver])

      ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
      ob.accept_button_click(server,Thread.current[:driver])

      ob=SignOut::UserSignOut.new
      ob.sign_out(server,Thread.current[:driver])
    end

    user_name='sakib4'
    password='1234'

    ob=Email::EmailAccess.new
    ob.get_link(server,Thread.current[:driver],user_name,password,ip)

    user_name='Sakib4'
    password='1@#Asd'
    confirm_password='1@#Asd'
    ob=Registration::UserRegistration.new
    ob.registration_completion(server,Thread.current[:driver],user_name,password,confirm_password)

    sleep 2
    folder_name='Folder3'
    file_name='test1.txt'
    user_name='sakib4@nilavodev.com'
    password='1@#Asd'
    ob=SignIn::UserSignIn.new
    ob.user_sign_in(server,Thread.current[:driver],user_name,password)
    p  url=Thread.current[:driver].current_url.to_s
    if url=="http://#{server}/sync/tos"
      sleep 2
      p
      ob=TOS::ActionOnTos.new
      ob.tos_accept(server,Thread.current[:driver])

    else

      home.home_page(server,Thread.current[:driver])

      ob=Notification::SharingNotificationBell.new
      ob.sharing_notification_envelop_click(server,Thread.current[:driver])

      ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
      ob.accept_button_click(server,Thread.current[:driver])

      home.home_page(server,Thread.current[:driver])

      ob=FolderOperations::FolderOperationsDetails.new
      ob.folder_select(server,Thread.current[:driver],folder_name)

      sleep 2
      ob=FileOperations::FileOperationsDetails.new
      ob.file_download(server,Thread.current[:driver],file_name)

      ob=SignOut::UserSignOut.new
      ob.sign_out(server,Thread.current[:driver])
    end
    sleep 2
    folder_name='Sent Links Test'
    file_name='C:\test1.txt'
    user_name='user_r@qa-server5.com'
    password='1234'
    ob=SignIn::UserSignIn.new
    ob.user_sign_in(server,Thread.current[:driver],user_name,password)

    ob=Notification::NotificationBell.new
    ob.notification_bell_click(server,Thread.current[:driver])
    ob.notification_bell_click_accept(server,Thread.current[:driver])

    ob=Home::GoToHome.new
    ob.go_to_received_link(server,Thread.current[:driver])

    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_select(server,Thread.current[:driver],folder_name)

    ob=FileOperations::FileOperationsDetails.new
    ob.file_upload(server,Thread.current[:driver],file_name)

  end
end


threads.each { |thread| thread.join }