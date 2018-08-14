module SignOut

  class UserSignOut

    def sign_out(server, driver)
      begin
        sleep 2
        #driver.find_element(:css, 'b.caret').click
        driver.find_element(:link, 'Logout').click
        sleep 2
      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end

    end
  end
end