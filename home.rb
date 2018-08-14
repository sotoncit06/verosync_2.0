module Home

  class GoToHome

    def home_page(server, driver)
      begin
        driver.find_element(:xpath, "//img[@id='logo-img']").click
        sleep(3)
      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"

      end

    end

    def sharing_page(server, driver)
      begin
        driver.find_element(:css, "#side-menu-sharing > a > span.ng-binding").click
        sleep 2
      rescue Exception => e

        puts "sharing_page(): not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end

    end

    def go_to_received_link(server, driver)
      begin
        driver.find_element(:link, 'Links').click
        sleep 2
        driver.find_element(:link, 'Received Links').click
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

    def go_to_sent_link(server, driver)
      begin
        driver.find_element(:link, 'Links').click
        sleep 2
        driver.find_element(:link, 'Sent Links').click
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

    def search_in_home(server,driver,file_name) # search file or folder in Home
      begin
      file_name=file_name.to_s
      driver.find_element(:link,file_name)
        p 'File exists'
        rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.file_not_found
        puts e.message
      end
    end
  end
end