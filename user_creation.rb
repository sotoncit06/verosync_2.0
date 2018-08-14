require 'require_files'
def user_creation(server, driver, browser)

  ob=SignIn::UserSignIn.new
  ob.user_sign_in(server,driver,"tanim1@nilavodev.com","1")
  sleep 2

  user_name='Tanim2'
  email='tanim2@nilavodev.com'
  password=''
  conf_pass=''
  role='Sync'
  ob=UserManagement::ManageUsers.new
  ob.create_user(server,driver,user_name,email,password,conf_pass,role)

  user_name='Tanim2'
  email='tanim2@nilavodev.com'
  password='Ta'
  conf_pass='T'
  role='Sync'
  ob=UserManagement::ManageUsers.new
  ob.create_user(server,driver,user_name,email,password,conf_pass,role)

  user_name=''
  email='tanim2@nilavodev.com'
  password='Tanim2!'
  conf_pass='Tanim2!'
  role='Sync'
  ob=UserManagement::ManageUsers.new
  ob.create_user(server,driver,user_name,email,password,conf_pass,role)

  user_name='Tanim2'
  email=''
  password='Tanim2!'
  conf_pass='Tanim2!'
  role='Sync'
  ob=UserManagement::ManageUsers.new
  ob.create_user(server,driver,user_name,email,password,conf_pass,role)

  user_name='Tanim2'
  email='tanim2@nilavodev.com'
  password=''
  conf_pass='Tanim2!'
  role='Sync'
  ob=UserManagement::ManageUsers.new
  ob.create_user(server,driver,user_name,email,password,conf_pass,role)

  user_name='Tanim2'
  email='tanim2@nilavodev.com'
  password='Tanim2!'
  conf_pass=''
  role='Sync'
  ob=UserManagement::ManageUsers.new
  ob.create_user(server,driver,user_name,email,password,conf_pass,role)

  user_name='Tanim2'
  email='tanim2@nilavodev.com'
  password='Tanim2!'
  conf_pass='Tanim2!'
  role='Sync'
  ob=UserManagement::ManageUsers.new
  ob.create_user(server,driver,user_name,email,password,conf_pass,role)

  user_name='Tanim3'
  email='tanim3@nilavodev.com'
  password='Tanim3!'
  conf_pass='Tanim3!'
  role='Sync'
  ob=UserManagement::ManageUsers.new
  ob.create_user(server,driver,user_name,email,password,conf_pass,role)

  user_name='Tanim4'
  email='tanim4@nilavodev.com'
  password='Tanim4!'
  conf_pass='Tanim4!'
  role='Collaborator'
  ob=UserManagement::ManageUsers.new
  ob.create_user(server,driver,user_name,email,password,conf_pass,role)

  user_name='Tanim5'
  email='tanim5@nilavodev.com'
  password='Tanim5!'
  conf_pass='Tanim5!'
  role='Recipient'
  ob=UserManagement::ManageUsers.new
  ob.create_user(server,driver,user_name,email,password,conf_pass,role)

end