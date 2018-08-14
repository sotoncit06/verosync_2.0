a=Time.now()
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

elsif i--3

  server ="http://192.168.10.7:8080/sync"
  ip= "192.168.10.7:8080"

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


        #Create user sarja1 to sarja4 and sarja6 to sarja8


        username= "tanim1@nilavodev.com"
        passwd="1"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)


        for i in 1..4
            role="Sync"
            username="sarja#{i}"
            email= "sarja#{i}@nilavodev.com"
            passwd = "1As!#"
            confirm_passwd = "1As!#"
            ob=UserManagement::ManageUsers.new
            ob.create_user(server,Thread.current[:driver],username,email,passwd,confirm_passwd,role)
        end

        for i in 6..8

            sync_role = "Sync"
            collaborator_role = "Collaborator"
            recipient_role = "Recipient"
            username="sarja#{i}"
            email= "sarja#{i}@nilavodev.com"
            passwd = "1As!#"
            confirm_passwd = "1As!#"

            if i==6

                ob=UserManagement::ManageUsers.new
                ob.create_user(server,Thread.current[:driver],username,email,passwd,confirm_passwd,sync_role)

            elsif i==7

                ob=UserManagement::ManageUsers.new
                ob.create_user(server,Thread.current[:driver],username,email,passwd,confirm_passwd,collaborator_role)
            elsif i==8

                ob=UserManagement::ManageUsers.new
                ob.create_user(server,Thread.current[:driver],username,email,passwd,confirm_passwd,recipient_role)

            end
        end

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])





        #TODO::1.1.1 to 1.1.3 later

        #1.2.1 starts here
        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        sleep 5


        folder_name="Folder 1"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_creation(server, Thread.current[:driver], folder_name)
        ob.folder_select(server, Thread.current[:driver], folder_name)


        file_location="C:\\Files\\file 1.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_upload(server, Thread.current[:driver], file_location)
        ob=Home::GoToHome.new
        ob.home_page(server, Thread.current[:driver])
        sleep 5

        folder_name="Folder 2"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_creation(server, Thread.current[:driver], folder_name)


        folder_name= "Folder 2"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)
        sleep 5
        sub_folder_name="Sub folder 1"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_creation(server, Thread.current[:driver], sub_folder_name)
        ob.folder_select(server, Thread.current[:driver], sub_folder_name)

        file_location="C:\\Files\\file 2.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_upload(server, Thread.current[:driver], file_location)

        ob=Home::GoToHome.new
        ob.home_page(server, Thread.current[:driver])

        file_location="C:\\Files\\file 3.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_upload(server, Thread.current[:driver], file_location)

        file_location="C:\\Files\\file 4.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_upload(server, Thread.current[:driver], file_location)


        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


        #1.2.6 ends here


        #2.1.1 starts here
        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        folder_name= "Folder 1"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)

        ob=PopupWindow::SharingPopupWindowBehaviour.new
        ob.share_folder_option_click(server, Thread.current[:driver])

        ob=PopupWindow::SharingPopupWindowBehaviour.new
        ob.cancel_button_click(server, Thread.current[:driver])


        ob=PopupWindow::SharingPopupWindowBehaviour.new
        ob.share_folder_option_click(server, Thread.current[:driver])

        recipient="asafafasf@ghakh"
        ob=PopupWindow::SharingPopupWindowBehaviour.new
        ob.email_entry(server, Thread.current[:driver], recipient)

        ob=PopupWindow::SharingPopupWindowBehaviour.new
        ob.share_button_click(server, Thread.current[:driver])


        ob=PopupWindow::SharingPopupWindowBehaviour.new
        ob.cancel_button_click(server, Thread.current[:driver])

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


        #2.1.10 ends here


        #2.6 starts here


        username= "sarja2@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)


        ob=Notification::SharingNotificationBell.new
        ob.sharing_notification_envelop_click(server, Thread.current[:driver])

        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.close_button_click(server, Thread.current[:driver])


        ob=PopupWindow::UnSubscribedFolderPopupWindow.new
        ob.unsubscribed_folder_list_open(server, Thread.current[:driver])
        ob.close_click(server, Thread.current[:driver])


        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.invitation_popup_window_select(server, Thread.current[:driver])
        ob.close_button_click(server, Thread.current[:driver])

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])
        #2.6.8 ends here





        #2.2.1 starts here

        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        sleep 2


        folder_name= "Folder 1"
        recipient= "sarja2@nilavodev.com"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_share(server, Thread.current[:driver], folder_name, recipient)


        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


        user_name="sarja2"
        password="1234"
        ob=Email::EmailAccess.new
        ob.get_link(server, Thread.current[:driver], user_name, password, ip)


        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in_with_password_only(server, Thread.current[:driver], passwd)

        sleep 2


        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.close_button_click(server, Thread.current[:driver])


        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja2@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        ob=Notification::NotificationBell.new
        ob.notification_bell_click(server, Thread.current[:driver])

        ob=Notification::SharingNotificationBell.new
        ob.sharing_notification_envelop_click(server, Thread.current[:driver])

        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.decline_button_click(server, Thread.current[:driver])
        sleep 2

        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.close_button_click(server, Thread.current[:driver])

        sleep 2

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)


        folder_name= "Folder 1"


        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_unshare_without_retain_copy(server, Thread.current[:driver], folder_name)


        folder_name= "Folder 1"
        recipient= "sarja2@nilavodev.com"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_share(server, Thread.current[:driver], folder_name, recipient)

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


        username= "sarja2@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        ob=Notification::SharingNotificationBell.new
        ob.sharing_notification_envelop_click(server, Thread.current[:driver])

        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.accept_button_click(server, Thread.current[:driver])

        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.close_button_click(server, Thread.current[:driver])


        sleep 2

        #TODO:: file download includes

        folder_name="Folder 1"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)
        file_name= "file 1.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_download_firefox(server, Thread.current[:driver], file_name)


        #TODO:: 2.2.18 check mail for accept confirmation.

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)


        folder_name= "Folder 1"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_unshare_without_retain_copy(server, Thread.current[:driver], folder_name)


        folder_name= "Folder 1"
        recipient_one= "sarja2@nilavodev.com"
        recipient_two= "sarja3@nilavodev.com"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_share_multiple_user(server, Thread.current[:driver], folder_name, recipient_one, recipient_two)

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])
        username= "sarja2@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        ob=Notification::SharingNotificationBell.new
        ob.sharing_notification_envelop_click(server, Thread.current[:driver])

        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.accept_button_click(server, Thread.current[:driver])


        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.close_button_click(server, Thread.current[:driver])

        sleep 2

        #TODO:: file download includes

        folder_name="Folder 1"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)
        file_name= "file 1.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_download_firefox(server, Thread.current[:driver], file_name)

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja3@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        ob=Notification::SharingNotificationBell.new
        ob.sharing_notification_envelop_click(server, Thread.current[:driver])

        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.accept_button_click(server, Thread.current[:driver])


        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.close_button_click(server, Thread.current[:driver])
        sleep 2
        #TODO:: file download includes


        folder_name="Folder 1"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)
        file_name= "file 1.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_download_firefox(server, Thread.current[:driver], file_name)

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        #2.2.21 ends here


        #TODO:: 2.3 will be included here


        #2.4.1 starts here. Shared folder option operation from owners end


        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        sleep 5


        ob=Home::GoToHome.new
        ob.sharing_page(server, Thread.current[:driver])

        sleep 5

        ob=Home::GoToHome.new
        ob.home_page(server, Thread.current[:driver])

        folder_name="Folder 1"
        ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
        ob.shared_already_folder_option_click(server, Thread.current[:driver], folder_name)


        ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
        ob.done_button_click(server, Thread.current[:driver])


        folder_name="Folder 1"
        ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
        ob.shared_already_folder_option_click(server, Thread.current[:driver], folder_name)

        ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
        ob.remove_user_button_click(server, Thread.current[:driver])
        ob.remove_user_cancel_button_click(server, Thread.current[:driver])
        ob.remove_user_button_click(server, Thread.current[:driver])
        ob.remove_user_ok_button_click(server, Thread.current[:driver])
        ob.done_button_click(server, Thread.current[:driver])

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja3@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        ob=Home::GoToHome.new
        ob.sharing_page(server, Thread.current[:driver])

        #TODO:: no folder retained message should be included and checked

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)


        folder_name="Folder 1"
        ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
        ob.shared_already_folder_option_click(server, Thread.current[:driver], folder_name)
        ob.invite_people_click(server, Thread.current[:driver])
        ob.invite_people_cancel_click(server, Thread.current[:driver])
        ob.done_button_click(server, Thread.current[:driver])

        folder_name="Folder 1"
        recipient="sarja3@nilavodev.com"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_share_invite(server, Thread.current[:driver], folder_name, recipient)


        ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
        ob.done_button_click(server, Thread.current[:driver])

        #TODO:: before accepting the share request remove the user

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])



        username= "sarja3@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)


        ob=Notification::SharingNotificationBell.new
        ob.sharing_notification_envelop_click(server, Thread.current[:driver])

        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.accept_button_click(server, Thread.current[:driver])
        ob.close_button_click(server, Thread.current[:driver])
        sleep 3
        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        folder_name="Folder 1"
        ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
        ob.shared_already_folder_option_click(server, Thread.current[:driver], folder_name)
        ob.remove_user_button_click(server, Thread.current[:driver])
        ob.remove_user_retain_copy_check(server, Thread.current[:driver])
        ob.remove_user_ok_button_click(server, Thread.current[:driver])

        ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
        ob.done_button_click(server, Thread.current[:driver])

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja3@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        ob=Home::GoToHome.new
        ob.sharing_page(server, Thread.current[:driver])
        ob.home_page(server, Thread.current[:driver])


        #TODO:: retained copy of folder should be checked

        #TODO:: file download includes


        folder_name="Folder 1"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)
        file_name= "file 1.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_download_firefox(server, Thread.current[:driver], file_name)


        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        folder_name="Folder 1"
        recipient="sarja3@nilavodev.com"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_share_invite(server, Thread.current[:driver], folder_name, recipient)

        ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
        ob.done_button_click(server, Thread.current[:driver])

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja3@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        ob=Notification::SharingNotificationBell.new
        ob.sharing_notification_envelop_click(server, Thread.current[:driver])

        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.accept_button_click(server, Thread.current[:driver])

        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.close_button_click(server, Thread.current[:driver])
        sleep 2
        ob=Home::GoToHome.new
        ob.sharing_page(server, Thread.current[:driver])

        #TODO:: Folder with suffix report includes

        ob.home_page(server, Thread.current[:driver])


        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])
        username= "sarja6@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)
            folder_name="Folder 1"
            ob=FolderOperations::FolderOperationsDetails.new
            ob.folder_creation(server, Thread.current[:driver], folder_name)

        folder_name="Folder 1"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)

        file_location="C:\\Files\\file 3.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_upload(server, Thread.current[:driver], file_location)

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja3@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        folder_name="Folder 1 (1)"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)

        #TODO:: file download includes

        file_name= "file 1.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_download_firefox(server, Thread.current[:driver], file_name)


        sleep 2

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        folder_name="Folder 1"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_unshare_with_retain_copy(server, Thread.current[:driver], folder_name)

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja2@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        ob=Home::GoToHome.new
        ob.sharing_page(server, Thread.current[:driver])

        #TODO:: Retained copy of folder check
        #TODO:: file download includes
        ob.home_page(server, Thread.current[:driver])

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        folder_name="Folder 1"
        recipient="sarja2@nilavodev.com"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_share(server, Thread.current[:driver], folder_name, recipient)

        folder_name="Folder 1"
        ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
        ob.shared_already_folder_option_click(server, Thread.current[:driver], folder_name)
        ob.remove_user_button_click_2(server, Thread.current[:driver])
        ob.remove_user_cancel_button_click(server, Thread.current[:driver])
        ob.remove_user_button_click_2(server, Thread.current[:driver])
        ob.remove_user_ok_button_click(server, Thread.current[:driver])

            ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
            ob.done_button_click(server, Thread.current[:driver])
#Need to add something
        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)


        folder_name="Folder 1"
        recipient="sarja2@nilavodev.com"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_share_invite(server, Thread.current[:driver], folder_name, recipient)

            ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
            ob.done_button_click(server, Thread.current[:driver])
#need ot add something
        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja2@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        ob=Notification::SharingNotificationBell.new
        ob.sharing_notification_envelop_click(server, Thread.current[:driver])

        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.accept_button_click(server, Thread.current[:driver])


            ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
            ob.close_button_click(server, Thread.current[:driver])

#need to add something
        ob=Home::GoToHome.new
        ob.sharing_page(server, Thread.current[:driver])

        #TODO:: Folder with suffix report includes

        ob.home_page(server, Thread.current[:driver])


        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        folder_name="Folder 1"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_unshare_without_retain_copy(server, Thread.current[:driver], folder_name)

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


        username= "sarja2@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        ob=Home::GoToHome.new
        ob.home_page(server, Thread.current[:driver])

        #TODO:: folder not retained confirmation


        folder_name= "Folder 1"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_delete(server, Thread.current[:driver], folder_name)

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja3@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        ob=Home::GoToHome.new
        ob.home_page(server, Thread.current[:driver])


        folder_name= "Folder 1 (1)"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_delete(server, Thread.current[:driver], folder_name)

        ob=Home::GoToHome.new
        ob.home_page(server, Thread.current[:driver])


        folder_name= "Folder 1"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_delete(server, Thread.current[:driver], folder_name)


        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        #2.4.54 ends here

        #TODO:: Collaborator sharing case will be included
        #TODO:: Recipient role user sharing case will be included

        # 2.5 starts here

        #2.5.1 to 2.5.3 already implemented in the last block


        #2.5.4 starts here


        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)


        folder_name= "Folder 1"
        recipient= "sarja2@nilavodev.com"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_share(server, Thread.current[:driver], folder_name, recipient)

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja2@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)


        ob=Notification::SharingNotificationBell.new
        ob.sharing_notification_envelop_click(server, Thread.current[:driver])

        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.accept_button_click(server, Thread.current[:driver])


            ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
            ob.close_button_click(server, Thread.current[:driver])
#need to add something
        ob=Home::GoToHome.new
        ob.home_page(server, Thread.current[:driver])

        folder_name= "Folder 1"
        ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
        ob.shared_already_folder_option_click(server, Thread.current[:driver], folder_name)

        folder_name= "Folder 1"
        ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
        ob.done_button_click(server, Thread.current[:driver])

        folder_name= "Folder 1"
        ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
        ob.shared_already_folder_option_click(server, Thread.current[:driver], folder_name)

        ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
        ob.remove_user_button_click_2(server, Thread.current[:driver])
        ob.remove_user_cancel_button_click(server, Thread.current[:driver])
        ob.remove_user_button_click_2(server, Thread.current[:driver])
        ob.remove_user_ok_button_click(server, Thread.current[:driver])


        ob=Home::GoToHome.new

        ob.home_page(server, Thread.current[:driver])

        ob=PopupWindow::UnSubscribedFolderPopupWindow.new
        ob.unsubscribed_folder_list_open(server, Thread.current[:driver])
        ob.close_click(server, Thread.current[:driver])
        ob.unsubscribed_folder_list_open(server, Thread.current[:driver])
        ob.rejoin_click(server, Thread.current[:driver])
        ob.rejoin_click_cancel(server, Thread.current[:driver])
        ob.rejoin_click(server, Thread.current[:driver])
        ob.rejoin_click_ok(server, Thread.current[:driver])

            ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
            ob.close_button_click(server, Thread.current[:driver])

#need to add something
        ob=Home::GoToHome.new
        ob.home_page(server, Thread.current[:driver])

        #TODO:: file download will be included


        folder_name="Folder 1"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)
        file_name= "file 1.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_download_firefox(server, Thread.current[:driver], file_name)

        folder_name= "Folder 1"
        ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
        ob.shared_already_folder_option_click(server, Thread.current[:driver], folder_name)

        ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
        ob.remove_user_button_click_2(server, Thread.current[:driver])
        ob.remove_user_ok_button_click(server, Thread.current[:driver])

        ob=PopupWindow::UnSubscribedFolderPopupWindow.new
        ob.unsubscribed_folder_list_open(server, Thread.current[:driver])
        ob.remove_click(server, Thread.current[:driver])
        ob.remove_click_cancel(server, Thread.current[:driver])
        ob.remove_click(server, Thread.current[:driver])
        ob.remove_click_ok(server, Thread.current[:driver])


            ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
            ob.close_button_click(server, Thread.current[:driver])
#need to add something

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        folder_name="Folder 1"
        recipient= "sarja2@nilavodev.com"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_share_invite(server, Thread.current[:driver], folder_name, recipient)
            ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
            ob.done_button_click(server, Thread.current[:driver])
#need to add something

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja2@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        ob=Notification::SharingNotificationBell.new
        ob.sharing_notification_envelop_click(server, Thread.current[:driver])

        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.accept_button_click(server, Thread.current[:driver])

        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.close_button_click(server, Thread.current[:driver])

        folder_name= "Folder 1"
        ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
        ob.shared_already_folder_option_click(server, Thread.current[:driver], folder_name)

        ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
        ob.remove_user_button_click_2(server, Thread.current[:driver])
        ob.remove_user_retain_copy_check(server, Thread.current[:driver])
        ob.remove_user_ok_button_click(server, Thread.current[:driver])

        ob=Home::GoToHome.new
        ob.home_page(server, Thread.current[:driver])

        #TODO:: file download will be included


        folder_name="Folder 1"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)
        file_name= "file 1.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_download_firefox(server, Thread.current[:driver], file_name)

        sleep 4

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        folder_name="Folder 1"
        ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
        ob.shared_already_folder_option_click(server, Thread.current[:driver], folder_name)
        ob.remove_user_button_click_2(server, Thread.current[:driver])
        ob.remove_user_cancel_button_click(server, Thread.current[:driver])
        ob.remove_user_button_click_2(server, Thread.current[:driver])
        ob.remove_user_ok_button_click(server, Thread.current[:driver])
        ob.done_button_click(server, Thread.current[:driver])

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        #2.5.43 ends here

        #3.1 starts here

        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)
        sleep 5
        folder_name="Shared Folder"
        folder_name_2="Folder sarja1"
        recipient="sarja2@nilavodev.com"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_creation(server, Thread.current[:driver], folder_name)
        ob.folder_select(server, Thread.current[:driver], folder_name)
        ob.folder_creation(server, Thread.current[:driver], folder_name_2)

        file_location="C:\\Files\\test sarja1.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_upload(server, Thread.current[:driver], file_location)

        ob=Home::GoToHome.new
        ob.home_page(server, Thread.current[:driver])

        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_share(server, Thread.current[:driver], folder_name, recipient)


        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja2@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)
        ob=Notification::SharingNotificationBell.new
        ob.sharing_notification_envelop_click(server, Thread.current[:driver])

        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.accept_button_click(server, Thread.current[:driver])

        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.close_button_click(server, Thread.current[:driver])
        sleep 5

        folder_name="Shared Folder"
        folder_name_2="Folder sarja2"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)
        ob.folder_creation(server, Thread.current[:driver], folder_name_2)

        file_location="C:\\Files\\test sarja2.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_upload(server, Thread.current[:driver], file_location)


        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        folder_name="Shared Folder"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)


        #TODO:: filed download will be included

        file_name= "test sarja2.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_download_firefox(server, Thread.current[:driver], file_name)

        #TODO:: folder and file existence should be reported

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        #3.1.10 ends here

        #3.2 starts here


        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)


        folder_name_1="Shared Folder"
        folder_name_2="Folder sarja1"

        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name_1)
        ob.folder_delete(server, Thread.current[:driver], folder_name_2)


        file_name= "test sarja1.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_delete(server, Thread.current[:driver], file_name)

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja2@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)


        folder_name="Shared Folder"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)

        #TODO:: file fodler delete confirmation message

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        #3.2.6 ends here


        #3.3.1 starts here

        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        folder_name_1="Shared Folder"
        folder_name_2="Folder sarja2"
        renamed_name="New Folder Renamed"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name_1)
        ob.folder_rename(server, Thread.current[:driver], folder_name_2, renamed_name)

        ob=Home::GoToHome.new
        ob.home_page(server, Thread.current[:driver])

        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name_1)

        file_name="test sarja2"
        renamed_name="new renamed.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_rename(server, Thread.current[:driver], file_name, renamed_name)

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja2@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        folder_name="Shared Folder"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


        #3.3.5 ends here #TODO::complete rename button problem figure out later

        #3.4 starts here


        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        folder_name_1="Shared Folder"
        folder_name_2="New Folder Renamed"
        description_1="Description 1"
        description_2="Description sub folder 1"

        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_update_description(server, Thread.current[:driver], folder_name_1, description_1)
        ob.folder_update_description(server, Thread.current[:driver], folder_name_2, description_2)


        ob=Home::GoToHome.new
        ob.home_page(server, Thread.current[:driver])
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name_1)

        file_name="new renamed.txt"
        description="description file 1"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_Update_description(server, Thread.current[:driver], file_name, description)

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja2@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        sleep 5


        ob=Home::GoToHome.new
        ob.home_page(server, Thread.current[:driver])

        folder_name="Shared Folder"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)

        sleep 5

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        #3.4.4 ends here

        #3.5 starts here

        username= "sarja2@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)


        folder_name="Shared Folder"
        renamed_name="Shared Folder Renamed"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_rename(server, Thread.current[:driver], folder_name, renamed_name)

        sleep 4

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        sleep 2

        folder_name="Shared Folder"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)

        file_location="C:\\Files\\test only.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_upload(server, Thread.current[:driver], file_location)

        sleep 2

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])
        username= "sarja2@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        sleep 2

        folder_name="Shared Folder Renamed"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)

        sleep 2

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        #3.5.6 ends here #TODO::rename button problem figure out later


        #2.3 TODO:: 2.3 will be implemented later: share with unregistered user

        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)


        sleep 5

        folder_name="Unregistered user"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_creation(server, Thread.current[:driver], folder_name)

        folder_name="Unregistered user"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)

        file_location="C:\\Files\\file 3.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_upload(server, Thread.current[:driver], file_location)


        ob=Home::GoToHome.new
        ob.home_page(server, Thread.current[:driver])

        folder_name= "Unregistered user"
        recipient= "sarja5@nilavodev.com"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_share(server, Thread.current[:driver], folder_name, recipient)

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])
        user_name="sarja5"
        password="1234"
        ob=Email::EmailAccess.new
        ob.get_link(server, Thread.current[:driver], user_name, password, ip)

        sleep 10

        user_name="sarja5"
        password="1As!#"
        confirm_password="1As!#"
        ob=Registration::UserRegistration.new
        ob.registration_completion(server, Thread.current[:driver], user_name, password, confirm_password)


        sleep 5

        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in_with_password_only(server, Thread.current[:driver], passwd)

        sleep 2
        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.accept_button_click(server, Thread.current[:driver])
        ob.close_button_click(server, Thread.current[:driver])

        sleep 2
        ob=Home::GoToHome.new
        ob.home_page(server, Thread.current[:driver])
        sleep 2

        folder_name="Unregistered user"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)

        #TODO:: file download will be included

        file_name= "file 3.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_download_firefox(server, Thread.current[:driver], file_name)


        sleep 3

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        #TODO:: sharing page search fileter will be included

        #------------------------------------


        #----2.4.68 starts-- share with collaborator and with recipient role only user------
        # sarja6-sync role, sarja7 - collaborator, sarja8- reciopient


        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        sleep 5

        folder_name="Collaborator"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_creation(server, Thread.current[:driver], folder_name)
        ob.folder_select(server, Thread.current[:driver], folder_name)

        file_location="C:\\Files\\test.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_upload(server, Thread.current[:driver], file_location)

        ob=Home::GoToHome.new
        ob.home_page(server, Thread.current[:driver])
        sleep 5

        folder_name= "Collaborator"
        recipient_one= "sarja6@nilavodev.com" #have Sync role
        recipient_two= "sarja7@nilavodev.com" #collaborator role
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_share_multiple_user(server, Thread.current[:driver], folder_name, recipient_one, recipient_two)

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])

        username= "sarja6@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        sleep 5

        ob=Notification::SharingNotificationBell.new
        ob.sharing_notification_envelop_click(server, Thread.current[:driver])

        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.accept_button_click(server, Thread.current[:driver])

            ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
            ob.close_button_click(server, Thread.current[:driver])
#need to add something
        #TODO:: file download includes

        folder_name="Collaborator"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)
        file_name= "test.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_download_firefox(server, Thread.current[:driver], file_name)

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


        username= "sarja7@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        sleep 5

        ob=Notification::SharingNotificationBell.new
        ob.sharing_notification_envelop_click(server, Thread.current[:driver])

        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.accept_button_click(server, Thread.current[:driver])

        #TODO:: file download includes
##need to add something
            ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
            ob.close_button_click(server, Thread.current[:driver])

        folder_name="Collaborator"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)
        file_name= "test.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_download_firefox(server, Thread.current[:driver], file_name)


        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        sleep 5


        folder_name="Collaborator"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_unshare_with_retain_copy(server, Thread.current[:driver], folder_name)

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


        username= "sarja6@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)
        sleep 5
        #TODO check for folder collaborator
        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


        username= "sarja7@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)
        sleep 5
        #TODO check for folder collaborator
        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


        #recipient


        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        sleep 5

        folder_name="Recipient"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_creation(server, Thread.current[:driver], folder_name)
        ob.folder_select(server, Thread.current[:driver], folder_name)

        file_location="C:\\Files\\recipient.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_upload(server, Thread.current[:driver], file_location)

        ob=Home::GoToHome.new
        ob.home_page(server, Thread.current[:driver])
        sleep 5

        folder_name= "Recipient"
        recipient= "sarja8@nilavodev.com" #recipient role only
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_share(server, Thread.current[:driver], folder_name, recipient)

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


        username= "sarja8@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        sleep 5

        ob=Notification::SharingNotificationBell.new
        ob.sharing_notification_envelop_click(server, Thread.current[:driver])

        ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
        ob.accept_button_click(server, Thread.current[:driver])

            ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
            ob.close_button_click(server, Thread.current[:driver])
#need to add something
        ob=Home::GoToHome.new
        ob.home_page(server, Thread.current[:driver])

        folder_name="Recipient"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)

        file_location="C:\\Files\\sarja7.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_upload(server, Thread.current[:driver], file_location)

        sleep 5

        #TODO:: file download includes

        folder_name="Recipient"
        #ob=FolderOperations::FolderOperationsDetails.new
        #ob.folder_select(server, Thread.current[:driver], folder_name)
        file_name= "recipient.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_download_firefox(server, Thread.current[:driver], file_name)

        sleep 3

        file_name="recipient.txt"
        renamed_name="recipient renamed.txt"
        ob=FileOperations::FileOperationsDetails.new
        ob.file_rename(server, Thread.current[:driver], file_name, renamed_name)


        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


        username= "sarja1@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        sleep 5


        folder_name="Recipient"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_select(server, Thread.current[:driver], folder_name)

        ob=FileOperations::FileOperationsDetails.new
        ob.file_download_firefox(server, Thread.current[:driver], "sarja7.txt")

        #TODO file existence check and rename check


        ob=Home::GoToHome.new
        ob.home_page(server, Thread.current[:driver])

        sleep 2

        folder_name="Recipient"
        ob=FolderOperations::FolderOperationsDetails.new
        ob.folder_unshare_with_retain_copy(server, Thread.current[:driver], folder_name)

        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


        username= "sarja8@nilavodev.com"
        passwd="1As!#"
        ob=SignIn::UserSignIn.new
        ob.user_sign_in(server, Thread.current[:driver], username, passwd)

        sleep 5

        #TODO check folder existence


        ob=SignOut::UserSignOut.new
        ob.sign_out(server, Thread.current[:driver])


    end
end
threads.each { |thread| thread.join }

b=Time.now()
puts "#{(b-a).to_s} s"
puts "#{((b-a)/60).to_s} m"
puts "#{((b-a)/3600).to_s} h"

