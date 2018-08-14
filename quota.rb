require 'require_files'

def quota(server, driver, browser)
  ob=SignIn::UserSignIn.new
  ob.user_sign_in(server, driver, "tanim1@nilavodev.com", "1")
  sleep 2

  ob=QuotaConfiguration::SetQuota.new
  ob.see_profile(server, driver)

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  ob=QuotaConfiguration::SetQuota.new
  ob.set_quota(server, driver)

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  file1='C:\Users\Sakib\Desktop\Quota\5mb.txt'
  file2='C:\Users\Sakib\Desktop\Quota\1MB.txt'

  ob=FileOperations::FileOperationsDetails.new
  ob.file_upload(server, driver, file1)
  sleep 2
  ob.file_upload(server, driver, file2)
  sleep 2

  user_name='tanim1@nilavodev.com'
  quota_limit='10'
  ob=QuotaConfiguration::SetQuota.new
  ob.set_user_quota(server, driver, user_name, quota_limit)

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  folder_name="Folder1"
  rec1='tanim2@nilavodev.com'
  rec2='tanim3@nilavodev.com'

  ob=FolderOperations::FolderOperationsDetails.new
  ob.folder_creation(server, driver, folder_name)
  sleep 2
  ob.folder_share_multiple_user(server, driver, folder_name, rec1, rec2)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server, driver)

  ob=SignIn::UserSignIn.new
  ob.user_sign_in(server, driver, "tanim2@nilavodev.com", "Tanim2!")
  sleep 2

  ob=QuotaConfiguration::SetQuota.new
  ob.see_profile(server, driver)

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  ob=Notification::SharingNotificationBell.new
  ob.sharing_notification_envelop_click(server, driver)

  ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
  ob.accept_button_click(server, driver)
  sleep 2
  ob.close_button_click(server, driver)

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  folder_name="Folder1"
  ob=FolderOperations::FolderOperationsDetails.new
  ob.folder_select(server, driver, folder_name,)

  file1='C:\Users\Sakib\Desktop\Quota\4MB.txt'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_upload(server, driver, file1)

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  file1='C:\Users\Sakib\Desktop\Quota\1MB.txt'
  file2='C:\Users\Sakib\Desktop\Quota\1MB - Copy'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_upload(server, driver, file1)
  ob.file_upload(server, driver, file2)

  ob=QuotaConfiguration::SetQuota.new
  ob.see_profile(server, driver)

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server, driver)


  ob=SignIn::UserSignIn.new
  ob.user_sign_in(server, driver, "tanim3@nilavodev.com", "Tanim3!")
  sleep 2

  ob=QuotaConfiguration::SetQuota.new
  ob.see_profile(server, driver)

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  ob=Notification::SharingNotificationBell.new
  ob.sharing_notification_envelop_click(server, driver)

  ob=PopupWindow::SharedFolderInvitationPopupWindowBehaviour.new
  ob.accept_button_click(server, driver)
  ob.close_button_click(server, driver)

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  folder_name='Folder1'
  ob=FolderOperations::FolderOperationsDetails.new
  ob.folder_select(server, driver, folder_name)

  file1='C:\Users\Sakib\Desktop\Quota\1MB.txt'
  file2='C:\Users\Sakib\Desktop\Quota\.5MB'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_upload(server, driver, file1)
  # sleep 2
  # ob.file_upload(server, driver, file2)

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  file1='C:\Users\Sakib\Desktop\Quota\5MB.txt'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_upload(server, driver, file1)

  ob=QuotaConfiguration::SetQuota.new
  ob.see_profile(server, driver)

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  folder_name='Folder1'
  ob=FolderOperations::FolderOperationsDetails.new
  ob.folder_delete(server, driver, folder_name)

  ob=FileOperations::FileOperationsDetails.new
  ob.file_upload(server, driver, file1)

  ob=QuotaConfiguration::SetQuota.new
  ob.see_profile(server, driver)

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server, driver)

  ob=SignIn::UserSignIn.new
  ob.user_sign_in(server, driver, "tanim2@nilavodev.com", "Tanim2!")
  sleep 2

  folder_name='Folder1'
  ob=FolderOperations::FolderOperationsDetails.new
  ob.folder_select(server, driver, folder_name)

  file_name='4MB.txt'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_delete(server, driver, file_name)
  sleep 2

  ob=QuotaConfiguration::SetQuota.new
  ob.see_profile(server, driver)

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  file1='C:\Users\Sakib\Desktop\Quota\3MB'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_upload(server, driver, file1)


  ob=SignOut::UserSignOut.new
  ob.sign_out(server, driver)

  ob=SignIn::UserSignIn.new
  ob.user_sign_in(server, driver, "tanim1@nilavodev.com", "1")
  sleep 2

  ob=QuotaConfiguration::SetQuota.new
  ob.see_profile(server, driver)

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  file_name='5mb.txt'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_delete(server, driver, file_name)
  sleep 2

  file1='C:\Users\Sakib\Desktop\Quota\4MB.txt'
  ob.file_upload(server, driver, file1)

  ob=Trash::TrashOperations.new
  ob.file_delete(server, driver)

  ob=QuotaConfiguration::SetQuota.new
  ob.see_profile(server, driver)

  ob=Home::GoToHome.new
  ob.home_page(server, driver)

  ob=FileOperations::FileOperationsDetails.new
  file1='C:\Users\Sakib\Desktop\Quota\5MB.txt'
  ob.file_upload(server, driver, file1)

  sleep 5

  ob=SignOut::UserSignOut.new
  ob.sign_out(server, driver)

end
