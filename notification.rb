module Notification

  class NotificationBell

    def notification_bell_click(server, driver)
      begin
        sleep 2
        driver.find_element(:css, 'button.dropdown-toggle.notification-button').click
        sleep 2
      rescue Exception => e
        puts "notification_bell_click(): button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception

        #puts "Rescue"
      end
    end

    #click cancel button only

    def notification_bell_click_accept(server, driver)
      begin
        sleep 2
        driver.find_element(:xpath, "//button[@type='submit']").click
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

    def notification_bell_click_decline(server, driver)
      begin
        sleep 2
        driver.find_element(:xpath, "(//button[@type='submit'])[2]").click
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

  class SharingNotificationBell

    def sharing_notification_envelop_click(server, driver)

      begin
        sleep 2
        driver.find_element(:link, 'Sharing').click
        sleep 2
        driver.find_element(:css, 'a.btn.btn-default > span.glyphicon.glyphicon-envelope').click
        sleep 2

      rescue Exception => e

        puts "sharing_notification_envelop_click(): button not found"
        #puts "Rescue"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
      end


    end

  end
end