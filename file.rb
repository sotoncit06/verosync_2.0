require 'require_files'

def file_operations_details(server, driver, browser)


  ob=SignIn::UserSignIn.new
  ob.user_sign_in(server, driver, "tanim1@nilavodev.com", "1")

  sleep 2
  file_location='C:\Users\Sakib\Desktop\sync\Issues.docx'

  recipients='tanim2@nilavodev.com,'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_upload(server, driver, file_location)

  file_name='Issues.docx'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_download(server, driver, file_name)

  ob=FileOperations::FileOperationsDetails.new
  ob.file_sent_link(server, driver, file_name, recipients)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server, driver)

  ob=SignIn::UserSignIn.new
  ob.user_sign_in(server, driver, "tanim2@nilavodev.com", "Tanim2!")
  sleep 2

  file_name='Issues.docx'
  ob=FileOperations::FileOperationsDetails.new
  ob.received_file_download(server, driver, file_name)
  sleep 2
  driver.navigate.refresh
  sleep 2
  ob.received_file_get_link(server, driver, file_name)
  sleep 2
  ob.received_file_get_message(server, driver, file_name)
  sleep 2
  ob.received_file_get_history(server, driver, file_name)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server, driver)

  ob=SignIn::UserSignIn.new
  ob.user_sign_in(server, driver, "tanim1@nilavodev.com", "1")
  sleep 2

  file_name='Issues.docx'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_history(server, driver, file_name)

  ob=FileOperations::FileOperationsDetails.new
  ob.file_version(server, driver, file_name)

  file_name='Issues.docx'
  description='description'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_Update_description(server, driver, file_name, description)

  renamed_name='Renamed.docx'
  ob=FileOperations::FileOperationsDetails.new
  ob.file_rename(server, driver, file_name, renamed_name)

  file_name=renamed_name
  ob=FileOperations::FileOperationsDetails.new
  ob.file_delete(server, driver, file_name)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server, driver)
end
