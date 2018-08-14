require 'require_files'

def trash_restore(server, driver, browser)

  ob=SignIn::UserSignIn.new
  ob.user_sign_in(server, driver, "tanim1@nilavodev.com", "1")
  sleep 2

  folder_name='Delete'
  ob=FolderOperations::FolderOperationsDetails.new
  ob.folder_creation(server,driver,folder_name)

  ob=FolderOperations::FolderOperationsDetails.new
  ob.folder_select(server,driver,folder_name)

  file_location='C:\Users\Sakib\Desktop\sync\Delete.txt'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_upload(server,driver, file_location)

  ob=Home::GoToHome.new
  ob.home_page(server,driver )
  sleep 2

  folder_name='Dont Delete'
  ob=FolderOperations::FolderOperationsDetails.new
  ob.folder_creation(server,driver,folder_name)

  ob=FolderOperations::FolderOperationsDetails.new
  ob.folder_select(server,driver,folder_name)

  file_location='C:\Users\Sakib\Desktop\sync\Dont Delete.txt'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_upload(server,driver, file_location)

  ob=Home::GoToHome.new
  ob.home_page(server,driver )
  sleep 2

  file_location='C:\Users\Sakib\Desktop\sync\Issues.docx'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_upload(server,driver, file_location)

  file_location='C:\Users\Sakib\Desktop\sync\Delete.txt'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_upload(server,driver, file_location)

  file_location='C:\Users\Sakib\Desktop\sync\Dont Delete.txt'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_upload(server,driver, file_location)

  folder_name='Delete'
  ob=FolderOperations::FolderOperationsDetails.new
  ob.folder_delete(server, driver, folder_name)

  ob=Home::GoToHome.new
  ob.home_page(server,driver )
  sleep 2

  file_name='Delete.txt'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_delete(server, driver, file_name)

  ob=Trash::TrashOperations.new
  ob.file_restore(server, driver)

  ob=Home::GoToHome.new
  ob.home_page(server,driver )
  sleep 2

  folder_name='Delete'
  ob=FolderOperations::FolderOperationsDetails.new
  ob.folder_delete(server, driver, folder_name)

  ob=Home::GoToHome.new
  ob.home_page(server,driver )
  sleep 2

  file_name='Delete.txt'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_delete(server, driver, file_name)

  ob=Trash::TrashOperations.new
  ob.clean_trash(server, driver)

  ob=Home::GoToHome.new
  ob.home_page(server,driver )
  sleep 2

  folder_name='Dont Delete'
  ob=Trash::TrashOperations.new
  ob.search_in_home(server, driver, folder_name)

  file_name='Dont Delete.txt'
  ob=Trash::TrashOperations.new
  ob.search_in_home(server, driver, file_name)

  folder_name='Dont Delete'
  ob=FolderOperations::FolderOperationsDetails.new
  ob.folder_delete(server, driver, folder_name)

  file_name='Dont Delete.txt'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_delete(server, driver, file_name)

  ob=Trash::TrashOperations.new
  ob.file_delete(server, driver)
  sleep 2

  ob=Home::GoToHome.new
  ob.home_page(server,driver)


  folder_name='Collaborator'
  ob=FolderOperations::FolderOperationsDetails.new
  ob.folder_delete(server, driver, folder_name)

  file_location='C:\Users\Sakib\Desktop\sync\Dont Delete.txt'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_upload(server,driver, file_location)

  ob=Trash::TrashOperations.new
  ob.delete_all_from_home(server, driver)

  ob=Trash::TrashOperations.new
  ob.clean_trash(server, driver)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server, driver)
end