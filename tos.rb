module TOS
  class ActionOnTos
    def tos_accept(server, driver)
      begin
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

    def tos_decline(server, driver)
      begin
        driver.find_element(:link, 'Cancel').click
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