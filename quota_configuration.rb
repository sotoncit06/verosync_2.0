module QuotaConfiguration
  class SetQuota
    def set_quota(server, driver)
      begin
        driver.find_element(:xpath, '//li[@id="settingSidemenu"]/a/span[2]').click
        sleep (3)
        driver.find_element(:xpath, '//li[@id="settingSidemenu"]/ul/li/a').click
        sleep (3)
        driver.find_element(:xpath, '//div[@id="sec0"]/div[3]').click
        driver.find_element(:css, 'label > input.ng-pristine.ng-valid').click
        sleep (3)
        driver.find_element(:xpath, '(//input[@type="text"])[4]').clear
        driver.find_element(:xpath, '(//input[@type="text"])[4]').send_keys("5")
        driver.find_element(:xpath, '(//button[@type="submit"])[11]').click
        sleep 2
        driver.find_element(:css, '#logo-img').click
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

    def set_user_quota(server, driver, user_name, quota_limit)
      begin
        driver.find_element(:xpath, '//li[@id="adminSidemenu"]/a/span[2]').click
        sleep 2
        driver.find_element(:xpath, '//li[@id="adminSidemenu"]/ul/li/a').click
        sleep 2
        driver.find_element(:xpath, "//span[contains(..,'#{user_name}')]").click
        sleep 2
        driver.find_element(:xpath, '//a[contains(text(),"Edit")]').click
        sleep 2
        driver.find_element(:css, 'input[name="space-quota"]').clear
        driver.find_element(:css, 'input[name="space-quota"]').send_keys "#{quota_limit}"
        sleep 2
        driver.find_element(:xpath, '(//button[@type="submit"])[11]').click
      end
    end

    def see_profile(server, driver)
      driver.find_element(:xpath, '//a[contains(@href, "#menu1")]').click
      sleep 2
      driver.find_element(:link, 'Profile').click
      sleep 2
    end
  end
end