module FileOperations
  class FileOperationsDetails
    def file_upload(server, driver, file_location)
      begin
        driver.find_element(:id, "uploadManager").click
        sleep (2)
        driver.switch_to.frame("uploadFrame")
        driver.find_element(:id, "html5-input-file").send_keys "#{file_location}"
        sleep 3
        driver.find_element(:id, "html5-uploader-close-button").click
        sleep 3
        driver.switch_to.default_content
        sleep 5

      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end

    def file_download(server, driver, file_name)
      begin
        driver.find_element(:xpath, "//a[@class='file-name']/descendant::span[text()='#{file_name}']").click
        sleep 5

      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end

    def file_download_firefox(server, driver, file_name)
      begin
        sleep 5
        driver.find_element(:xpath, "//a[@class='file-name']/descendant::span[text()='#{file_name}']").click
        sleep 2

        window = RAutomation::Window.new(:title => /Opening #{file_name}/i)
        window.activate
        sleep 2
        p window.exists? # => true
        sleep 2
        window.send_keys(:down)
        window.send_keys(:enter)


      rescue Exception => e
        puts "File #{file_name}}does not exists"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message

        #puts "Rescue"
      end
    end


    def file_sent_link(server, driver, file_name, recipients)
      begin
        driver.find_element(:xpath, "//span[contains(..,'#{file_name}')]").click
        sleep 2
        driver.find_element(:xpath, '//ul[@id="contextMenu"]/li[3]/a').click
        sleep (2)
        driver.find_element(:xpath, '(//input[@type="text"])[5]').send_keys "#{recipients}"
        sleep (2)
        driver.action.send_keys(:enter)
        #driver.find_element(:id, "message").send_keys("Sign in")
        driver.find_element(:xpath, '//div[@id="shareLink"]/div/div/div/form/fieldset/div[4]/div/button').click
        sleep (5)
      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end

    def file_history(server, driver, file_name)
      begin
        driver.find_element(:xpath, "//span[contains(..,'#{file_name}')]").click
        sleep 2
        driver.find_element(:xpath, '(//a[contains(text(),"History")])[2]').click
        sleep (10)
        driver.find_element(:link, 'Home').click
        sleep (2)

      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end

    def file_version(server, driver, file_name)
      begin
        driver.find_element(:xpath, "//span[contains(..,'#{file_name}')]").click
        sleep 2
        driver.find_element(:xpath, '//a[contains(text(),"Versions")]').click
        sleep (10)
        driver.find_element(:xpath, '//a[contains(text(),"Home")]').click
        sleep (2)
      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end

    def file_Update_description(server, driver, file_name, description)
      begin
        driver.find_element(:xpath, "//span[contains(..,'#{file_name}')]").click
        sleep 2
        driver.find_element(:xpath, '(//a[contains(text(),"Update Description")])[2]').click
        sleep (2)
        driver.find_element(:xpath, '//textarea[@id="item-name"]').clear
        sleep 2
        driver.find_element(:xpath, '//textarea[@id="item-name"]').send_keys("#{description}")
        sleep (2)
        driver.find_element(:xpath, '(//button[@type="submit"])[9]').click
        sleep (2)
      rescue Exception => e
        #puts e.message
        puts "file_Updat_description():button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end
    end

    def file_rename(server, driver, file_name, renamed_name)
      begin
        driver.find_element(:xpath, "//span[contains(..,'#{file_name}')]").click
        sleep 2
        driver.find_element(:xpath, '(//a[contains(text(),"Rename")])[2]').click
        sleep (2)
        driver.find_element(:xpath, '//input[@id="item-name"]').clear
        sleep (2)
        driver.find_element(:xpath, '//input[@id="item-name"]').send_keys "#{renamed_name}"
        sleep (2)
        driver.find_element(:xpath, '(//button[@type="submit"])[8]').click
        sleep (2)
      rescue

        puts "file_rename(): button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
      end
    end

    def file_delete(server, driver, file_name)
      begin
        driver.find_element(:xpath, "//span[contains(..,'#{file_name}')]").click
        sleep 2
        driver.find_element(:xpath, '(//a[contains(text(),"Delete")])[2]').click
        sleep (2)
        #driver.find_element(:xpath, '(//button[@type="button"])[61]').click
        driver.find_element(:xpath, '(//button[@type="button"])[62]').click
        #driver.find_element(:xpath, '(//button[@type="button"])[64]').click
        sleep (2)
      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end


    def received_file_download(server, driver, file_name)
      begin
        driver.find_element(:link, 'Links').click
        sleep 2
        driver.find_element(:xpath, "//body[@id='ng-app']/div/div[5]/div/ul/li[3]/ul/li[2]/a/span[2]").click
        sleep 2
        driver.find_element(:xpath, "//a[@class='file-name']/descendant::span[text()='#{file_name}']").click
        sleep 5
      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end

    def received_file_get_link(server, driver, file_name)
      begin
        driver.find_element(:xpath, "//span[contains(..,'#{file_name}')]").click
        sleep 2
        driver.find_element(:xpath, '//a[contains(text(),"Get link")]').click
        sleep 2
        driver.find_element(:xpath, '(//button[@type="button"])[6]').click
      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end

    def received_file_get_message(server, driver, file_name)
      begin
        driver.find_element(:xpath, "//span[contains(..,'#{file_name}')]").click
        sleep 2
        driver.find_element(:xpath, '//a[contains(text(),"Get message")]').click
        sleep 2
        driver.find_element(:xpath, '(//button[@type="button"])[6]').click

      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end


    def received_file_get_history(server, driver, file_name)
      begin
        driver.find_element(:xpath, "//span[contains(..,'#{file_name}')]").click
        sleep 2
        driver.find_element(:xpath, '//a[contains(text(),"History")]').click
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

    def all_file_delete(server, driver)
      begin
        driver.find_element(:css, 'input[type="checkbox"]').click
        sleep 2
        driver.find_element(:css, 'td.fm-table-name-col').click
        sleep 2
        driver.find_element(:xpath, '(//a[contains(text(),"Delete")])[3]').click
        sleep 2
        driver.find_element(:xpath, '(//button[@type="button"])[60]').click
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