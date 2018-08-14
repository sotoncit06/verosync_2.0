module Registration
  class UserRegistration

    def registration_completion(server, driver, user_name, password, confirm_password)
      begin
        sleep 2
        driver.find_element(:xpath, "//input[@name='name']").send_keys(user_name)
        driver.find_element(:xpath, "//input[@name='password']").send_keys(password)
        driver.find_element(:xpath, "//input[@name='confirmPassword']").send_keys(confirm_password)
        sleep 1
        driver.find_element(:xpath, "//button[@type='submit']").click
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