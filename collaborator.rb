require 'require_files'

def collaborator_operations(server, driver, browser)
    ob=SignIn::UserSignIn.new
    ob.user_sign_in(server,driver,"tanim1@nilavodev.com","1")

    folder_name='Collaborator'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_creation(server, driver, folder_name)

    recipient='tanim5@nilavodev.com'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_share(server, driver, folder_name, recipient)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    ob=SignIn::UserSignIn.new
    ob.user_sign_in(server,driver,"tanim5@nilavodev.com","Tanim5!")

    file_name='C:\Users\Sakib\Desktop\ws\collaborator.txt'
    ob=FileOperations::FileOperationsDetails.new
    ob.file_upload(server, driver, file_name)

    ob=Notification::SharingNotificationBell.new
    ob.sharing_notification_envelop_click(server, driver)

    ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
    ob.accept_button_click(server, driver)
    sleep 2
    ob.close_button_click(server, driver)

    ob=Home::GoToHome.new
    ob.home_page(server, driver)

    folder_name='Collaborator'
    description='description of colaborator'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_update_description(server, driver, folder_name, description)

    ob=Home::GoToHome.new
    ob.home_page(server, driver)

    rename_folder='Renamed_folder'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_rename(server, driver, folder_name, rename_folder)

    # ob=FolderOperations::FolderOperationsDetails.new
    # ob.folder_select(server, driver,rename_folder)

    folder_name='Collaborator'
    description='Created by collaborator'

    ob.sub_folder_creation(server, driver,folder_name, description)

    file1='C:\Users\Sakib\Desktop\ws\collaborator.txt'
    ob=FileOperations::FileOperationsDetails.new
    ob.file_upload(server, driver, file1)

    ob=Home::GoToHome.new
    ob.home_page(server, driver)

    folder_name='Renamed_folder'
    ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
    ob.shared_already_folder_option_click(server, driver, folder_name)
    ob.remove_user_button_click(server, driver)
    ob.remove_user_ok_button_click(server,driver)
    sleep 2

    ob=SignOut::UserSignOut.new
    ob.sign_out(server, driver)

    ob=SignIn::UserSignIn.new
    ob.user_sign_in(server, driver, 'tanim2@nilavodev.com','Tanim2!')

    folder_name='Folder2'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_creation(server, driver, folder_name)
    sleep 3

    ob=Home::GoToHome.new
    ob.home_page(server, driver)

    folder_name='Folder3'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_creation(server, driver, folder_name)
    sleep 3

    folder_name='Folder2'
    recipient='tanim1@nilavodev.com'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_share(server,driver,folder_name, recipient)

    sleep 2

    ob=Home::GoToHome.new
    ob.home_page(server, driver)
    folder_name='Folder3'

    recipient='tanim1@nilavodev.com'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_sent_link_add_file(server,driver,folder_name, recipient)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server, driver)

    ob=SignIn::UserSignIn.new
    ob.user_sign_in(server, driver, 'tanim1@nilavodev.com','1')

=begin
    role='Collaborator'
    ob=UserManagement::ManageUsers.new
    ob.edit_user(server, driver, 'tanim2@nilavodev.com', role)
=end

    sleep 3
    ob=Home::GoToHome.new
    ob.go_to_received_link(server,driver)

    folder_name='Folder3'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_select(server,driver, folder_name)

    file_location='C:\Users\Sakib\Desktop\sync\Test.docx'
    ob=FileOperations::FileOperationsDetails.new
    ob.file_upload(server,driver,file_location)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    ob=SignIn::UserSignIn.new
    ob.user_sign_in(server, driver, 'tanim2@nilavodev.com', 'Tanim2!')
    sleep 2

    folder_name='Folder2'
    ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
    ob.shared_already_folder_option_click(server, driver, folder_name)

    ob=PopupWindow::SharedFolderOptionPopupWindowBehaviour.new
    ob.remove_user_button_click(server, driver)
    ob.remove_user_ok_button_click(server, driver)

    ob=Home::GoToHome.new
    ob.home_page(server, driver)

    file_location='C:\Users\Sakib\Desktop\sync\Test.docx'
    ob=FileOperations::FileOperationsDetails.new
    ob.file_upload(server,driver,file_location)

    folder_name='Folder3'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_select(server, driver,folder_name)

    file_location='C:\Users\Sakib\Desktop\sync\Test.docx'
    ob=FileOperations::FileOperationsDetails.new
    ob.file_upload(server,driver,file_location)

    ob=Home::GoToHome.new
    ob.go_to_sent_link(server, driver)

    folder_name='Folder3'

    ob=FolderOperations::FolderOperationsDetails.new
    ob.received_folder_edit(server, driver, folder_name)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server, driver)
end
