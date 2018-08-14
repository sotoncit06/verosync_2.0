require 'require_files'

def view_reports(server, driver, browser)
  ob=SignIn::UserSignIn.new
  ob.user_sign_in(server, Thread.current[:driver], "tanim1@nilavodev.com", "1")
  sleep 2
  filter_by_user='tanim1@nilavodev.com'
  ob=Reports::ViewReports.new

  ob.system_activity_report(server, Thread.current[:driver], filter_by_user)
  sleep 2
  ob.system_settings_change(server, Thread.current[:driver], filter_by_user)
  sleep 2

  ob.sent_links(server, Thread.current[:driver])
  sleep 2
  ob.licence_usages(server, Thread.current[:driver], filter_by_user)

  ob=SignOut::UserSignOut.new
  ob.sign_out(server, Thread.current[:driver])

end
