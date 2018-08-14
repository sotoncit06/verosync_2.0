module UserProfile
  class Profile
    def change_user_name(server, driver, user_name, rename)
      begin
        driver.find_element(:css, 'b.caret').click
        driver.find_element(:link, 'Profile').click
        sleep 2
        driver.find_element(:xpath, "(//a[contains(text(),'#{user_name}')])[3]").click
        driver.find_element(:xpath, "(//input[@type='text'])[3]").clear
        driver.find_element(:xpath, "(//input[@type='text'])[3]").send_keys "#{rename}"
        driver.find_element(:css, "span.editable-buttons > button.btn.btn-primary").click
        driver.find_element(:link, "Back").click
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

    def change_password(server, driver, current_pass, new_pass, confirm_pass)
      driver.find_element(:css, 'b.caret').click
      driver.find_element(:link, 'Change Password').click
      sleep 2
      driver.find_element(:xpath, "(//input[@name='currentPassword'])").send_keys(current_pass)
      driver.find_element(:xpath, "(//input[@name='password'])").send_keys(new_pass)
      driver.find_element(:xpath, "(//input[@name='confirmPassword'])").send_keys(confirm_pass)
      sleep 2
      driver.find_element(:xpath, "(//button[contains(text(),'Save')])").click
    end
  end

end