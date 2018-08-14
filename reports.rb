module Reports
  class ViewReports
    def system_activity_report(server, driver, filter_by_user)
      begin
        #driver.find_element(:xpath, '/body[@id="ng-app"]/div/div[4]/div/ul/li[5]/a/span[2]').click
        driver.find_element(:link, 'Reports').click
        sleep 2
        driver.find_element(:xpath, '//a[contains(text(),"System Activity")]').click
        sleep 5
        driver.find_element(:xpath, '//span[@type="button"]').click
        sleep 2
        driver.find_element(:xpath, '(//input[@id="srch-term"])[3]').send_keys("test")
        sleep 2
        driver.find_element(:xpath, '(//input[@type="text"])[6]').send_keys("#{filter_by_user},")
        sleep 2
        driver.action.send_keys(:enter)
        sleep 2
        driver.find_element(:xpath, '(//button[@type="submit"])[11]').click
        sleep 10
      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end

    end


    def system_settings_change(server, driver, filter_by_user)
      driver.find_element(:link, 'System Settings Change').click
      sleep 2
      driver.find_element(:xpath, '//span[@type="button"]').click
      sleep 2
      driver.find_element(:xpath, '(//input[@id="srch-term"])[3]').send_keys("test")
      sleep 2
      driver.find_element(:xpath, '(//input[@type="text"])[6]').send_keys("#{filter_by_user},")
      sleep 2
      driver.action.send_keys(:enter)
      sleep 2
      driver.find_element(:xpath, '(//button[@type="submit"])[11]').click
      sleep 10
    end


    def sent_links(server, driver)
      driver.find_element(:xpath, '//a[contains(text(),"Sent Links")]').click
      sleep 2
      driver.find_element(:xpath, '(//button[@type="submit"])[11]').click
      sleep 5
      driver.find_element(:css, 'select[name="name"]').click
      sleep 2
      driver.sendKeys(Keys.down)
      sleep 2
      driver.action.send_keys(:enter)
      sleep 2
      driver.find_element(:xpath, '(//button[@type="submit"])[11]').click
      sleep 5
    end


    def licence_usages(server, driver, filter_by_user)
      driver.find_element(:link, 'License Usage').click
      sleep 5
      driver.find_element(:xpath, '(//input[@type="text"])[3]').send_keys("#{filter_by_user},")
      sleep 2
      driver.action.send_keys(:enter)
      sleep 2
      driver.find_element(:xpath, '(//button[@type="submit"])[11]').click
      sleep 5
    end


  end
end