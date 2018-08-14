module SystemSettings

  class GeneralSettings

    def application(server,driver,admin_email)
      begin
        #xpath list
        email="(//input[@type='text'])[3]"
        quota="(//input[@type='text'])[4]"
        tos="(//input[@type='text'])[5]"

        sleep 1
        driver.find_element(:xpath, "//*[@id='ng-app']/div[1]/div[5]/div[1]/ul/li[7]/a/span[2]").click
        driver.find_element(:xpath, "//*[@id='ng-app']/div[1]/div[5]/div[1]/ul/li[7]/ul/li[1]/a/span[2]").click
        sleep 1
        driver.find_element(:css, "div.nlv-settings-row-title.ng-binding").click
        sleep 1
        driver.find_element(:xpath, email).clear
        driver.find_element(:xpath, email).send_keys(admin_email)
        driver.action.send_keys(:enter).perform
        if driver.find_element(:xpath, "(//input[@class='ng-pristine ng-valid'])").attribute('checked')
          driver.find_element(:xpath, quota).clear
          driver.find_element(:xpath, quota).send_keys("20")
          driver.find_element(:xpath, tos).clear
          driver.find_element(:xpath, tos).send_keys("http://www.google.com/intl/en/policies/terms")
          #driver.find_element(:xpath, "(//input[@type='text'])[5]").clear
          #driver.find_element(:xpath, "(//input[@type='text'])[5]").send_keys("Test")
          driver.find_element(:xpath, '//button[@class="btn btn-primary btn-sm submit-btn ng-binding"]').click
        else
          driver.find_element(:xpath, "(//input[@class='ng-pristine ng-valid'])").click
          driver.find_element(:xpath, quota).clear
          driver.find_element(:xpath, quota).send_keys("20")
          driver.find_element(:xpath, tos).clear
          driver.find_element(:xpath, tos).send_keys("http://www.google.com/intl/en/policies/terms")
          #driver.find_element(:xpath, "(//input[@type='text'])[5]").clear
          #driver.find_element(:xpath, "(//input[@type='text'])[5]").send_keys("Test")
          driver.find_element(:xpath, '//button[@class="btn btn-primary btn-sm submit-btn ng-binding"]').click
        end
      rescue Exception=> e
        puts __FILE__
        puts caller_locations
        puts e.message
        #puts "Rescue"
      end
    end

    def email(server,driver)
      begin
        sleep 1
        driver.find_element(:xpath, "//*[@id='ng-app']/div[1]/div[5]/div[1]/ul/li[7]/a/span[2]").click
        driver.find_element(:xpath, "//*[@id='ng-app']/div[1]/div[5]/div[1]/ul/li[7]/ul/li[1]/a/span[2]").click
        sleep 2
        driver.find_element(:xpath, "//div[contains(text(),'Email')]").click
        #driver.find_element(:css, "div.nlv-settings-row-title.ng-binding").click
        sleep 2
        #driver.find_element(:css, "#sec1 > div.nlv-settings-row-title.ng-binding").click
        driver.find_element(:xpath, "(//input[@type='text'])[6]").clear
        driver.find_element(:xpath, "(//input[@type='text'])[6]").send_keys("192.168.10.91")
        driver.find_element(:xpath, "(//input[@type='text'])[7]").clear
        driver.find_element(:xpath, "(//input[@type='text'])[7]").send_keys("sakib1@nilavodev.com")
        driver.find_element(:xpath, "(//input[@type='text'])[8]").clear
        driver.find_element(:xpath, "(//input[@type='text'])[8]").send_keys("25")
        driver.find_element(:xpath, "(//input[@type='password'])[1]").clear
        driver.find_element(:xpath, "(//input[@type='password'])[1]").send_keys("1234")
        driver.find_element(:xpath, "(//input[@type='password'])[2]").clear
        driver.find_element(:xpath, "(//input[@type='password'])[2]").send_keys("1234")

        Selenium::WebDriver::Support::Select.new(driver.find_element(:xpath, "//select")).select_by(:text, "None")
        #Selenium::WebDriver::Support::Select.new(driver.find_element(:xpath, "(//select[@name='name'])[1]")).select_by(:text, "HTTP")
        test_mail="(//button[@type='button'])[4]"
        confirm1="(//button[@type='button'])[7]"
        confirm2="(//button[@type='button'])[6]"
        save_button="(//button[@type='submit'])[8]"
        driver.find_element(:xpath, test_mail).click
        sleep 2
        driver.find_element(:xpath, confirm1).click
        sleep 2
        driver.find_element(:xpath, confirm2).click
        sleep 2
        driver.find_element(:xpath, save_button).click

        # #driver.find_element(:xpath, "//button[contains(text(),'Test Email Settings')]") .click
        sleep 2
        driver.find_element(:xpath, "(//button[@type='submit'])[4]").click
      rescue Exception=> e
        puts __FILE__
        puts caller_locations
        puts e.message
        #puts "Rescue"
      end
    end

    def mobile(server,driver)
      begin
        button_submit="(//button[@type='submit'])[9]"
        sleep 1
        driver.find_element(:xpath, "//*[@id='ng-app']/div[1]/div[5]/div[1]/ul/li[7]/a/span[2]").click
        driver.find_element(:xpath, "//*[@id='ng-app']/div[1]/div[5]/div[1]/ul/li[7]/ul/li[1]/a/span[2]").click
        sleep 2
        driver.find_element(:xpath, "//div[contains(text(),'Mobile')]").click
        sleep 2
        checkbox=driver.find_element(:xpath, "(//input[@type='checkbox'])[3]").attribute('checked')
        if checkbox==nil
          driver.find_element(:xpath, "(//input[@type='checkbox'])[3]").click
          sleep 4
          driver.find_element(:xpath, button_submit).click
        else
          driver.find_element(:xpath, button_submit).click
        end

      rescue Exception=> e
        puts __FILE__
        puts caller_locations
        puts e.message
      end
    end

    def encryption(server,driver)
      begin
        sleep 1
        driver.find_element(:xpath, "//*[@id='ng-app']/div[1]/div[5]/div[1]/ul/li[7]/a/span[2]").click
        driver.find_element(:xpath, "//*[@id='ng-app']/div[1]/div[5]/div[1]/ul/li[7]/ul/li[1]/a/span[2]").click
        sleep 2
        driver.find_element(:xpath, "//div[contains(text(),'Encryption')]").click
        sleep 2
        checkbox=driver.find_element(:xpath, "(//input[@type='checkbox'])[4]").attribute('checked')
        if checkbox==nil
          driver.find_element(:xpath, "(//input[@type='checkbox'])[4]").click
          sleep 4
          driver.find_element(:xpath, "(//button[@type='submit'])[10]").click
        else
          driver.find_element(:xpath, "(//button[@type='submit'])[10]").click
        end
      rescue Exception=> e
        puts __FILE__
        puts caller_locations
        puts e.message
        #puts "Rescue"
      end
    end



    def recaptcha(server,driver)
      begin
        button_save="(//button[@type='submit'])[11]"
        sleep 1
        driver.find_element(:xpath, "//*[@id='ng-app']/div[1]/div[5]/div[1]/ul/li[7]/a/span[2]").click
        driver.find_element(:xpath, "//*[@id='ng-app']/div[1]/div[5]/div[1]/ul/li[7]/ul/li[1]/a/span[2]").click
        sleep 2
        driver.find_element(:xpath, "//div[contains(text(),'reCAPTCHA Image Verification')]").click
        sleep 2
        checkbox=driver.find_element(:xpath, "(//input[@type='checkbox'])[5]")
        if checkbox.attribute("checked")
          if (server=="http://192.168.10.195/sync")
          driver.find_element(:xpath, "(//input[@type='text'])[10]").clear
          driver.find_element(:xpath, "(//input[@type='text'])[10]").send_keys "6LdEQvQSAAAAAPjsW5q74dyMMR-SwXG_5yeJhsHW"
          driver.find_element(:xpath, "(//input[@type='text'])[11]").clear
          driver.find_element(:xpath, "(//input[@type='text'])[11]").send_keys "6LdEQvQSAAAAAA_0lO3HEipc1-m-sgHYW4YAGEX2"
          else
            driver.find_element(:xpath, "(//input[@type='text'])[10]").clear
            driver.find_element(:xpath, "(//input[@type='text'])[10]").send_keys "6LfoQwwTAAAAAG3kLWMbIbs5KuAaK71C7MZ71h0R"
            driver.find_element(:xpath, "(//input[@type='text'])[11]").clear
            driver.find_element(:xpath, "(//input[@type='text'])[11]").send_keys "6LfoQwwTAAAAAMt8TgQZUnEP4aLWcwQ03XWRDk3C"
          end

          sleep 3
          driver.find_element(:xpath, button_save).click
        else
          checkbox.click
          sleep 2
          driver.find_element(:xpath, "(//input[@type='text'])[23]").clear
          driver.find_element(:xpath, "(//input[@type='text'])[23]").send_keys "6LdEQvQSAAAAAPjsW5q74dyMMR-SwXG_5yeJhsHW"
          driver.find_element(:xpath, "(//input[@type='text'])[24]").clear
          driver.find_element(:xpath, "(//input[@type='text'])[24]").send_keys "6LdEQvQSAAAAAA_0lO3HEipc1-m-sgHYW4YAGEX2"
          sleep 3
          driver.find_element(:xpath, button_save).click
        end
      rescue Exception=> e
        puts __FILE__
        puts caller_locations
        puts e.message
        #puts "Rescue"
      end
    end


    def version_retention(server,driver)
      begin
        sleep 1
        driver.find_element(:xpath, "//*[@id='ng-app']/div[1]/div[5]/div[1]/ul/li[7]/a/span[2]").click
        driver.find_element(:xpath, "//*[@id='ng-app']/div[1]/div[5]/div[1]/ul/li[7]/ul/li[1]/a/span[2]").click
        sleep 2
        driver.find_element(:xpath, "//div[contains(text(),'File Version Retention')]").click
        sleep 2
      rescue Exception=> e
        puts __FILE__
        puts caller_locations
        puts e.message
        #puts "Rescue"
      end
    end

  end

  class AuthenticationSettings
    def ad_authentication(server,driver)
      begin
        button_submit="(//button[@type='submit'])[7]"
        sleep 2
        driver.find_element(:link, "System Settings").click
        driver.find_element(:xpath, "//li[@id='settingSidemenu']/ul/li[2]/a/span[2]").click
        # driver.find_element(:xpath, "//li[7]/a/span[2]").click
        # driver.find_element(:xpath, "//li[@id='settingSidemenu']/ul/li[2]/a/span[2]").click
        #driver.find_element(:xpath, "//*[@id='ng-app']/div[1]/div[5]/div[1]/ul/li[7]/ul/li[1]/a/span[2]").click
        sleep 2
        driver.find_element(:xpath, "//div[contains(text(),'AD Authentication')]").click
        sleep 2
        if driver.find_element(:xpath, "//input[@type='checkbox']").attribute("checked")==nil
          driver.find_element(:xpath, "//input[@type='checkbox']").click
          sleep 4
          driver.find_element(:xpath, "(//input[@type='text'])[3]").clear
          driver.find_element(:xpath, "(//input[@type='text'])[3]").send_keys "AD"
          driver.find_element(:xpath, "(//input[@type='text'])[4]").clear
          driver.find_element(:xpath, "(//input[@type='text'])[4]").send_keys "qa-server5.com"
          driver.find_element(:xpath, "(//input[@type='text'])[6]").clear
          driver.find_element(:xpath, "(//input[@type='text'])[6]").send_keys "qa-server5\\user_s" #CN=user_s,CN=Users,DC=qa-server5,DC=com
          driver.find_element(:xpath, "(//input[@type='password'])").clear
          driver.find_element(:xpath, "(//input[@type='password'])").send_keys "1234"
          driver.find_element(:xpath, "(//input[@type='text'])[8]").send_keys ''
          driver.find_element(:xpath, "(//input[@type='text'])[8]").send_keys "*@qa-server5.com"
          sleep 2
          driver.find_element(:xpath, "(//input[@type='text'])[8]").send_keys(:enter)
          driver.find_element(:xpath, "//textarea[@type='text']").clear
          driver.find_element(:xpath, "//textarea[@type='text']").send_keys "Recipients"
          driver.find_element(:xpath, "(//textarea[@type='text'])[2]").clear
          driver.find_element(:xpath, "(//textarea[@type='text'])[2]").send_keys "Senders"
          driver.find_element(:xpath, "(//textarea[@type='text'])[3]").clear
          driver.find_element(:xpath, "(//textarea[@type='text'])[3]").send_keys "System Admin"
          driver.find_element(:xpath, "(//textarea[@type='text'])[4]").clear
          driver.find_element(:xpath, "(//textarea[@type='text'])[4]").send_keys "User Admin"
          driver.find_element(:xpath, "(//input[@type='text'])[12]").clear
          driver.find_element(:xpath, "(//input[@type='text'])[12]").send_keys "*@qa-server5.com"
          sleep 2
          driver.find_element(:xpath, "(//button[@type='submit'])[7]").click
        else
          sleep 4
          driver.find_element(:xpath, "(//input[@type='text'])[3]").clear
          driver.find_element(:xpath, "(//input[@type='text'])[3]").send_keys "AD"
          driver.find_element(:xpath, "(//input[@type='text'])[4]").clear
          driver.find_element(:xpath, "(//input[@type='text'])[4]").send_keys "qa-server5.com"
          driver.find_element(:xpath, "(//input[@type='text'])[6]").clear
          driver.find_element(:xpath, "(//input[@type='text'])[6]").send_keys "qa-server5\\user_s" #CN=user_s,CN=Users,DC=qa-server5,DC=com
          driver.find_element(:xpath, "(//input[@type='password'])").clear
          driver.find_element(:xpath, "(//input[@type='password'])").send_keys "1234"
          driver.find_element(:xpath, "(//input[@type='text'])[8]").send_keys ''
          driver.find_element(:xpath, "(//input[@type='text'])[8]").send_keys "*@qa-server5.com"
          sleep 2
          driver.find_element(:xpath, "(//input[@type='text'])[8]").send_keys(:enter)
          driver.find_element(:xpath, "//textarea[@type='text']").clear
          driver.find_element(:xpath, "//textarea[@type='text']").send_keys "Recipients"
          driver.find_element(:xpath, "(//textarea[@type='text'])[2]").clear
          driver.find_element(:xpath, "(//textarea[@type='text'])[2]").send_keys "Senders"
          driver.find_element(:xpath, "(//textarea[@type='text'])[3]").clear
          driver.find_element(:xpath, "(//textarea[@type='text'])[3]").send_keys "System Admin"
          driver.find_element(:xpath, "(//textarea[@type='text'])[4]").clear
          driver.find_element(:xpath, "(//textarea[@type='text'])[4]").send_keys "User Admin"
          driver.find_element(:xpath, "(//input[@type='text'])[12]").clear
          driver.find_element(:xpath, "(//input[@type='text'])[12]").send_keys "*@qa-server5.com"
          sleep 2
          driver.find_element(:xpath, "(//button[@type='submit'])[7]").click
          #driver.find_element(:xpath, "(//button[@type='submit'])[3]").click

        end

      rescue Exception=> e
        puts __FILE__
        puts caller_locations
        puts e.message
        #puts "Rescue"
      end
    end

    def password(server,driver)
      begin
        button_submit="(//button[@type='submit'])[8]"
        sleep 1
        driver.find_element(:link, "System Settings").click
        driver.find_element(:xpath, "//li[@id='settingSidemenu']/ul/li[2]/a/span[2]").click
        # driver.find_element(:xpath, "//li[7]/a/span[2]").click
        # driver.find_element(:xpath, "//li[@id='settingSidemenu']/ul/li[2]/a/span[2]").click
        sleep 3
        driver.find_element(:xpath, "//div[contains(text(),'Password')]").click
        #driver.find_element(:css, "div.nlv-settings-row-title.ng-binding").click
        sleep 2
        driver.find_element(:xpath, "(//input[@type='checkbox'])[3]").click
        driver.find_element(:xpath, "(//input[@type='checkbox'])[4]").click
        driver.find_element(:css, "label.ng-binding > input.ng-pristine.ng-valid").click
        driver.find_element(:css, "label.ng-binding > input.ng-pristine.ng-valid").click
        driver.find_element(:xpath, "//div[@id='settings-form']/div/div[3]/div/div[6]/div/label/input").click
        sleep 2
        driver.find_element(:xpath, "(//input[@type='text'])[13]").clear
        driver.find_element(:xpath, "(//input[@type='text'])[13]").send_keys "5"
        driver.find_element(:xpath, "(//input[@type='text'])[15]").clear
        driver.find_element(:xpath, "(//input[@type='text'])[15]").send_keys "1@#"
        driver.find_element(:xpath, "(//button[@type='submit'])[4]").click
        driver.find_element(:xpath, "(//button[@type='submit'])[4]").click
        driver.find_element(:xpath, "(//input[@type='text'])[15]").clear
        driver.find_element(:xpath, "(//input[@type='text'])[15]").send_keys "@#"
        driver.find_element(:xpath, "(//button[@type='submit'])[4]").click
        driver.find_element(:xpath, "(//input[@type='text'])[15]").clear
        driver.find_element(:xpath, "(//input[@type='text'])[15]").send_keys "!@#"
        sleep 5
        driver.find_element(:xpath, button_submit).click
      rescue Exception=> e
        puts __FILE__
        puts caller_locations
        puts e.message
        #puts "Rescue"
      end
    end

    def auto_unlocking(server,driver)
      driver.find_element(:xpath, "//li[7]/a/span[2]").click
      driver.find_element(:xpath, "//li[@id='settingSidemenu']/ul/li[2]/a/span[2]").click
      sleep 3
      driver.find_element(:xpath, "//div[contains(text(),'Auto Unlocking User Account')]").click
      sleep 2
      driver.find_element(:xpath, "(//input[@type='text'])[16]").clear
      driver.find_element(:xpath, "(//input[@type='text'])[16]").send_keys "5"
      driver.find_element(:xpath, "(//input[@type='text'])[17]").clear
      driver.find_element(:xpath, "(//input[@type='text'])[17]").send_keys "10"
      driver.find_element(:xpath, "(//input[@type='text'])[18]").clear
      driver.find_element(:xpath, "(//input[@type='text'])[18]").send_keys "10"
      driver.find_element(:xpath, "(//button[@type='submit'])[5]").click
      sleep 2
      driver.find_element(:xpath, "(//button[@type='submit'])[5]").click
    end

  end


  class CustomizationSettings

    def web_interface(server,driver)
      begin
        sleep 2
        driver.find_element(:xpath, "//li[7]/a/span[2]").click
        driver.find_element(:xpath, "//li[@id='settingSidemenu']/ul/li[3]/a/span[2]").click
        sleep 2
        driver.find_element(:xpath, "//div[contains(text(),'Web Interface')]").click
        sleep 5
        driver.find_element(:xpath, "(//input[@type='text'])[3]").clear
        driver.find_element(:xpath, "(//input[@type='text'])[3]").send_keys("#{server}/css/custom-css.css")
        driver.find_element(:xpath, "(//input[@type='text'])[4]").clear
        driver.find_element(:xpath, "(//input[@type='text'])[4]").send_keys("http://www.nilavo.com")
        driver.find_element(:xpath, "(//button[@type='submit'])[3]").click
      rescue Exception=> e
        puts __FILE__
        puts caller_locations
        puts e.message
        #puts "Rescue"
      end
    end

    def logo(server,driver)
      begin
        sleep 2
        driver.find_element(:xpath, "//li[7]/a/span[2]").click
        driver.find_element(:xpath, "//li[@id='settingSidemenu']/ul/li[3]/a/span[2]").click
        sleep 2
        driver.find_element(:xpath, "//div[contains(text(),'Logo')]").click
        sleep 2
        driver.find_element(:xpath, "//div[@id='sec1']").click
        driver.find_element(:xpath, "//input[@name='file']").send_keys "C:\\Users\\Sakib\\Desktop\\sft-logo.jpg"
        #driver.switch_to.default_content
        sleep 4
        driver.find_element(:xpath, "//input[@name='reset']").click
        driver.find_element(:xpath, "//input[@name='file']").send_keys "C:\\Users\\Sakib\\Desktop\\sft-logo.jpg"
      rescue Exception=> e
        puts __FILE__
        puts caller_locations
        puts e.message
        #puts "Rescue"
      end
    end
  end


end