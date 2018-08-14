require 'require_files'

def contacts_operations_details (server, driver, browser)
  ob=SignIn::UserSignIn.new
  ob.user_sign_in(server, driver, "tanim1@nilavodev.com", "1")
  sleep 2

  name='Tanim'
  address='tanim6@nilavodev.com'
  ob=Contacts::ContactsUsers.new
  ob.create_new_contact(server, driver, name, address)

  sleep 2

  name='Tanim5'
  address='tanim6@nilavodev.com'
  ob.edit_contact(server, driver, address, name)
  sleep 2
  ob.delete_contact(server, driver, address)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server, driver)

end
