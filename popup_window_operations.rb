module PopupWindow


  class SharingPopupWindowBehaviour #Only for sharing pop up window


    def share_folder_option_click(server, driver)

      begin
        sleep 2
        driver.find_element(:xpath, '(//button[@type="button"])[4]').click
        sleep (2)
        driver.find_element(:xpath, '//a[contains(text(),"Share Folder")]').click
        sleep (2)
      rescue Exception => e
        puts "share_folder_option_click():failed"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end

    end

    #opens the sharing pop up window

    def email_entry(server, driver, recipient)
      begin
        sleep (2)
        driver.find_element(:xpath, '(//input[@type="text"])[6]').send_keys("#{recipient},")
        sleep (2)
        driver.action.send_keys(:enter)
      rescue Exception => e
        puts "email_entry():failed"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end

    end

    #only gives entry of the email address, depends on the share_folder_option_click()

    def message_entry(server, driver)
      begin
        sleep (2)

        #driver.find_element(:xpath,"//div[@class='ng-pristine ng-valid ta-bind']/descendant::p[text()='']").click
        #driver.action.send_keys(:tab)

        #driver.find_element(:xpath, '//div[contains(@class= "ng-pristine ng-valid ta-bind")]').click
        #driver.find_element(:xpath, '//div[@class="ta-scroll-window ng-scope ta-text ta-editor form-control"]').send_keys("istiak")
        #driver.find_element(:xpath, '//div[id= "taTextElement9484899508739620" and @class="ng-pristine ng-valid ta-bind" and @contenteditable="true" and @ta-bind="ta-bind" and @ng-model="html"]').click

        #driver.find_element(:xpath, '//div[@ng-model= "html"]').click
        sleep (2)
      rescue Exception => e
        puts "message_entry():failed"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end
    end

    #Not completed. Message field detection problem

    def share_button_click(server, driver)
      begin
        sleep 2
        driver.find_element(:xpath, '//div[@id="shareFolder"]/div/div/div/form/fieldset/div[3]/div/button').click
        sleep (5)
      rescue Exception => e
        puts "share_button_click():failed to find the button"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end
    end

    # Only click the share button

    def send_invite_button_click(server, driver)
      begin
        sleep 2
        driver.find_element(:xpath, '//div[@id="shareFolder"]/div/div/div/form/fieldset/div[4]/div/button').click
        sleep (5)
      rescue Exception => e
        puts "share_button_click():failed to find the button"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end
    end

    #
    def cancel_button_click(server, driver)
      begin
        sleep 2
        #driver.find_element(:xpath, '//div[@id="shareFolder"]/div/div/div/form/fieldset/div[4]/div/button[2]').click
        driver.find_element(:xpath, '//div[@id="shareFolder"]/div/div/div/form/fieldset/div[3]/div/a').click
        sleep 2
      rescue Exception => e

        puts "cancel_button_function(): button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end
    end

    #click cancel button only

    def done_button_click(server, driver)

      begin
        sleep (2)
        driver.find_element(:xpath, '//a[contains(text(),"Done")]').click
        sleep (2)
      rescue Exception => e

        puts "done_button_click(): button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end
    end # click done button

    #more functions to be added

  end


  class SharedFolderInvitationPopupWindowBehaviour # Only for SHared folder invitation pop up window


    def close_button_click(server, driver)

      begin
        sleep 2
        driver.find_element(:xpath, '//a[contains(text(),"Close")]').click
        sleep 2
      rescue Exception => e

        puts "close_button_click(): button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end
    end

    #click cancel button only


    def accept_button_click(server, driver)

      begin
        sleep 2
        driver.find_element(:xpath, '//a[contains(text(),"Accept")]').click
        sleep 2
      rescue Exception => e

        puts "accept_button_click(): button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end

    end

    #TODO: for multiple shared folder how to detect and accept

    def decline_button_click(server, driver)


      begin
        sleep 2
        driver.find_element(:xpath, '//a[contains(text(),"Decline")]').click
        sleep 2
      rescue Exception => e

        puts "decline_button_click(): button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end


    end

    def invitation_popup_window_select(server, driver)
      begin
        sleep 2
        driver.find_element(:css, "#side-menu-sharing > a > span.ng-binding").click
        sleep 2
        driver.find_element(:xpath, '(//button[@type="button"])[4]').click
        sleep 2
        driver.find_element(:xpath, '//a[contains(text(),"Invitations")]').click
        sleep 2


      rescue Exception => e

        puts "invitation_popup_window_select(): button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end

    end

  end


  class SharedFolderOptionPopupWindowBehaviour


    def shared_already_folder_option_click(server, driver, folder_name)

      begin
        sleep 2
        driver.find_element(:css, '#logo-img').click
        sleep 2
        driver.find_element(:xpath, "//span[contains(..,'#{folder_name}')]").click
        sleep 2
        driver.find_element(:xpath, '//ul[@id="contextMenu"]/li[2]/a').click
        sleep 2

      rescue Exception => e

        puts "shared_already_folder_option_click(): button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end

    end

    # TO_DO

    def done_button_click(server, driver)

      begin
        sleep 2
        driver.find_element(:xpath, '//a[contains(text(),"Done")]').click
        sleep 2

      rescue Exception => e

        puts "done_button(): button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end

    end

    def unshare_button_click(server, driver)
      driver.find_element(:xpath, '//div[@id="modal-table-control"]/div/button[2]').click
      sleep 2
      driver.find_element(:xpath, '(//button[@type="button"])[60]').click
      sleep 2
    rescue Exception => e

      puts "Item not found: button not found"
      puts __FILE__
      puts caller_locations
      ob=Pause::PauseScript.new
      ob.pause_script_exception
    end

    #TODO: will implement in future

    def invite_people_click(server, driver)

      begin

        sleep 2
        driver.find_element(:css, '#add-users-btn').click
        sleep 2

      rescue Exception => e

        puts "invite_people_click: button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end

    end

    def invite_people_cancel_click(server, driver)
      begin

        sleep 2
        driver.find_element(:xpath, '//div[@id="shareFolder"]/div/div/div/form/fieldset/div[4]/div/button[2]').click
        sleep 2

      rescue Exception => e

        puts "invite_people_cancel_click: button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end


    end

    def remove_user_button_click(server, driver)

      begin

        sleep 2
        driver.find_element(:xpath, '//div[@id="sharedFolderOptions"]/div/div/div/form/fieldset/div/table/tbody/tr[2]/td[5]/a').click

        sleep 2


      rescue Exception => e

        puts "remove_user(): button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end


    end

    # TODO: function will be standardize now this is for sarja3

    def remove_user_button_click_2(server, driver)
      begin

        sleep 2
        driver.find_element(:xpath, '//div[@id="sharedFolderOptions"]/div/div/div/form/fieldset/div/table/tbody/tr[2]/td[5]/a').click

        sleep 2
      rescue Exception => e

        puts "remove_user_button_click_2(): button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end
    end

    #For sarja2

    def remove_user_cancel_button_click(server, driver)

      begin

        sleep 2
        driver.find_element(:xpath, '//body[@id="ng-app"]/div[3]/div/div/div[3]/button').click
        #driver.find_element(:xpath, "//body[@id='ng-app']/div[4]/div/div/div[3]/button").click


        sleep 2


      rescue Exception => e

        puts "remove_user_cancel_button(): button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end

    end

    def remove_user_ok_button_click(server, driver)
      begin

        sleep 2
        driver.find_element(:xpath, '(//button[@type="button"])[62]').click
        #driver.find_element(:xpath, "//body[@id='ng-app']/div[4]/div/div/div[3]/button[2]").click

        sleep 2
      rescue Exception => e

        puts "remove_user_ok_button_click(): button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end


    end

    def remove_user_retain_copy_check(server, driver)
      begin

        sleep 2
        driver.find_element(:css, 'input[name="chk"]').click

        sleep 2
      rescue Exception => e

        puts "remove_user_retaincopy_chek(): button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end


    end
  end

  class UnSubscribedFolderPopupWindow

    def unsubscribed_folder_list_open(server, driver)

      begin
        sleep 2
        driver.find_element(:css, "#side-menu-sharing > a > span.ng-binding").click
        sleep 2
        driver.find_element(:xpath, '(//button[@type="button"])[4]').click
        sleep 2
        driver.find_element(:xpath, '//a[contains(text(),"Unsubscribed folders")]').click
        sleep 2


      rescue Exception => e

        puts "unsubscribed_folder_list_open(): button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end


    end

    def rejoin_click(server, driver)
      begin
        sleep 2
        driver.find_element(:xpath, '//a[contains(text(),"Rejoin")]').click
        sleep 2

      rescue Exception => e

        puts "rejoin_click(): button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end


    end

    def rejoin_click_cancel(server, driver)

      begin
        sleep 2
        #driver.find_element(:xpath, '(//button[@type="button"])[37]').click
        driver.find_element(:xpath, '(//button[@type="button"])[34]').click
        sleep 2

      rescue Exception => e

        puts "rejoin_click_cancel(): button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end

    end

    def rejoin_click_ok(server, driver)
      begin
        sleep 5
        #driver.find_element(:xpath, '(//button[@type="button"])[38]').click
        driver.find_element(:xpath, '(//button[@type="button"])[35]').click
        sleep 2

      rescue Exception => e

        puts "rejoin_click_ok(): button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end

    end

    def remove_click(server, driver)
      begin
        sleep 2
        driver.find_element(:xpath, '//a[contains(text(),"Remove")]').click
        sleep 2

      rescue Exception => e

        puts "remove_click: button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end


    end

    def remove_click_cancel(server, driver)

      begin
        sleep 2
        #driver.find_element(:xpath, '(//button[@type="button"])[36]').click
        #driver.find_element(:xpath, '(//button[@type="button"])[33]').click
        #driver.find_element(:xpath, '(//button[@type="button"])[37]').click
        driver.find_element(:xpath, '(//button[@type="button"])[34]').click
        sleep 2

      rescue Exception => e

        puts "remove_click_cancel: button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end

    end

    def remove_click_ok(server, driver)

      begin
        sleep 2
        #driver.find_element(:xpath, '(//button[@type="button"])[37]').click
        #driver.find_element(:xpath, '(//button[@type="button"])[34]').click
        #driver.find_element(:xpath, '(//button[@type="button"])[38]').click
        driver.find_element(:xpath, '(//button[@type="button"])[35]').click
        sleep 2

      rescue Exception => e

        puts "remove_click_ok: button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end

    end

    def close_click(server, driver)
      begin
        sleep 2
        driver.find_element(:xpath, '(//a[contains(text(),"Close")])[2]').click
        sleep 2

      rescue Exception => e

        puts "close_click(): button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end

    end

  end


end