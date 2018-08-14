require 'require_files'

def folder_operations_details(server, driver, browser)
    driver.get "#{server}"


    ob=SignIn::UserSignIn.new
    ob.user_sign_in(server, driver, "tanim1@nilavodev.com", "1")

    sleep 2
    folder_name='Folder1'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_creation(server,driver,folder_name)

    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_select(server,driver,folder_name)

    file_location='C:\Users\Sakib\Desktop\sync\Issues.docx'
    ob=FileOperations::FileOperationsDetails.new
    ob.file_upload(server,driver, file_location)

    ob=Home::GoToHome.new
    ob.home_page(server,driver )
    sleep 2

    folder_name='Folder1'
    recipient='tanim2@nilavodev.com'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_share(server,driver, folder_name, recipient)

    ob=Home::GoToHome.new
    ob.home_page(server,driver )

    folder_name='Folder1'
    recipient='tanim2@nilavodev.com'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_sent_link_without_login(server,driver, folder_name, recipient)
    sleep 2

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    sleep 10
    user_name="tanim2"
    password="1234"

    ip='rupshav18'

    ob=Email::EmailAccess.new
    ob.get_link(server, driver, user_name, password,ip)

    file_name='Issues.docx'
    ob=FileOperations::FileOperationsDetails.new
    ob.file_download(server, driver, file_name)

    driver.find_element(:css, 'img').click
    sleep 2

    ob=SignIn::UserSignIn.new
    ob.user_sign_in(server,driver,"tanim1@nilavodev.com","1")
    sleep 2

    folder_name='Folder2'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_creation(server,driver, folder_name)

    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_select(server,driver,folder_name)

    file_location='C:\Users\Sakib\Desktop\sync\Issues.docx'
    ob=FileOperations::FileOperationsDetails.new
    ob.file_upload(server,driver, file_location)

    ob=Home::GoToHome.new
    ob.home_page(server,driver )

    folder_name='Folder2'
    recipient='tanim2@nilavodev.com'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_sent_link_add_file(server,driver, folder_name, recipient)
    sleep 2

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    ob=SignIn::UserSignIn.new
    ob.user_sign_in(server,driver,"tanim2@nilavodev.com","Tanim2!")
    sleep 2

    ob=Home::GoToHome.new
    ob.go_to_received_link(server,driver)

    folder_name='Folder2'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_select(server,driver, folder_name)

    file_name='Issues.docx'
    ob=FileOperations::FileOperationsDetails.new
    ob.file_download(server, driver, file_name)

    file_location='C:\Users\Sakib\Desktop\sync\Test.docx'
    ob=FileOperations::FileOperationsDetails.new
    ob.file_upload(server,driver,file_location)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    ob=SignIn::UserSignIn.new
    ob.user_sign_in(server,driver,"tanim1@nilavodev.com","1")
    sleep 2

    folder_name='Folder3'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_creation(server,driver, folder_name)

    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_select(server,driver,folder_name)

    file_location='C:\Users\Sakib\Desktop\sync\Issues.docx'
    ob=FileOperations::FileOperationsDetails.new
    ob.file_upload(server,driver, file_location)

    ob=Home::GoToHome.new
    ob.home_page(server,driver )

    folder_name='Folder3'
    recipient='tanim2@nilavodev.com'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_sent_link_no_file_add(server,driver, folder_name, recipient)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    ob=SignIn::UserSignIn.new
    ob.user_sign_in(server,driver,"tanim2@nilavodev.com","Tanim2!")
    sleep 2

    ob=Home::GoToHome.new
    ob.go_to_received_link(server,driver)

    folder_name='Folder3'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_select(server,driver, folder_name)

    file_name='Issues.docx'
    ob=FileOperations::FileOperationsDetails.new
    ob.file_download(server, driver, file_name)

    file_location='C:\Users\Sakib\Desktop\sync\Test1.docx'
    ob=FileOperations::FileOperationsDetails.new
    ob.file_upload(server,driver,file_location)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server,driver)

    ob=SignIn::UserSignIn.new
    ob.user_sign_in(server,driver,"tanim1@nilavodev.com","1")
    sleep 2
    folder_name='Folder1'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_history(server,driver,folder_name)

    ob=Home::GoToHome.new
    ob.home_page(server,driver )

    description='description'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_update_description(server, driver, folder_name, description)

    ob=Home::GoToHome.new
    ob.home_page(server, driver)

    rename_folder='Folder'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_rename(server, driver, folder_name, rename_folder)

    ob=Home::GoToHome.new
    ob.home_page(server, driver)

    folder_name=rename_folder
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_delete(server, driver, folder_name)

    folder_name='Folder2'
    destination_folder='Folder1'
    ob=FolderOperations::FolderOperationsDetails.new
    ob.folder_moved_to_shared_folder(server, driver, folder_name, destination_folder)

    ob=SignOut::UserSignOut.new
    ob.sign_out(server, driver)

end
