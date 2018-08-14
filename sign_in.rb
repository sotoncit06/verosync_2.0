module SignIn

  class UserSignIn

    def user_sign_in(server, driver, user_name, password)
      begin
        #Selenium code goes here
        #driver.get "#{server}"
        driver.manage.window.maximize
        driver.find_element(:id, 'email').clear
        driver.find_element(:id, 'email').send_keys("#{user_name}")
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys("#{password}")
        driver.find_element(:xpath, '//button[@type="submit"]').click
        tos = driver.current_url
        if(tos.include?"tos")
          sleep 2
          driver.find_element(:xpath, "//button[@type='submit']").click
          sleep 5
        end
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

    def user_sign_in_with_password_only(server, driver, password)

      begin
        #Selenium code goes here
        #driver.get "#{server}"
        driver.manage.window.maximize
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys("#{password}")
        driver.find_element(:xpath, '//button[@type="submit"]').click

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
  end

  class ADUserSignIn
    def ad_user_sender_signin(server, driver, domain)
      begin
        #Selenium code goes here
        driver.get "#{server}"
        driver.manage.window.maximize
        driver.find_element(:id, 'email').clear
        driver.find_element(:id, 'email').send_keys('user_s')
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys('1234')
        driver.find_element(:id, 'domain').clear
        driver.find_element(:id, 'domain').send_keys("#{domain}")
        driver.find_element(:xpath, '//button[@type="submit"]').click

        #define who will receive the delivery
        recipient='user_r@qa-server5.com'
        return recipient

      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end

    def ad_gc_sender_signin(server, driver, domain)
      begin
        #Selenium code goes here
        driver.get "#{server}"
        driver.manage.window.maximize
        driver.find_element(:id, "username").clear
        driver.find_element(:id, 'email').send_keys("user_s@#{domain}.com")
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys('1234')
        driver.find_element(:xpath, '//button[@type="submit"]').click

        #define who will receive the delivery
        recipient='user_r@qa-server5.com'
        return recipient

      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end

    def ad_upn_sender_signin(server, driver, domain)
      begin
        #Selenium code goes here
        driver.get "#{server}"
        driver.manage.window.maximize
        driver.find_element(:id, "username").clear
        driver.find_element(:id, 'email').send_keys("user_upn@#{domain}.com")
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys('1234')
        driver.find_element(:xpath, '//button[@type="submit"]').click

        #define who will receive the delivery
        recipient='user_r@qa-server5.com'
        return recipient

      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end

    def ad_default_domain_sender_signin(server, driver, domain)
      begin
        #Selenium code goes here
        driver.get "#{server}"
        driver.manage.window.maximize
        driver.find_element(:id, "username").clear
        driver.find_element(:id, 'email').send_keys("user_s")
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys('1234')
        driver.find_element(:xpath, '//button[@type="submit"]').click

        #define who will receive the delivery
        recipient='user_r@qa-server5.com'
        return recipient

      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end

    def ad_user_recipient_signin(server, driver, recipient, domain)
      begin
        #Selenium code goes here
        driver.get "#{server}"
        driver.manage.window.maximize
        driver.find_element(:id, 'email').clear
        driver.find_element(:id, 'email').send_keys("#{recipient}")
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys('1234')
        driver.find_element(:id, 'domain').clear
        driver.find_element(:id, 'domain').send_keys("#{domain}")
        driver.find_element(:xpath, '//button[@type="submit"]').click

      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end

    def ad_user_admin(server, driver, domain)
      begin
        #Selenium code goes here
        driver.get "#{server}"
        driver.manage.window.maximize
        driver.find_element(:id, 'email').clear
        driver.find_element(:id, 'email').send_keys('user_admin')
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys('1234')
        driver.find_element(:id, 'domain').clear
        driver.find_element(:id, 'domain').send_keys("#{domain}")
        driver.find_element(:xpath, '//button[@type="submit"]').click

        #define who will receive the delivery
        recipient='user_r@qa-server5.com'
        return recipient

      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end

    def ad_system_admin(server, driver, domain)
      begin
        #Selenium code goes here
        driver.get "#{server}"
        driver.manage.window.maximize
        driver.find_element(:id, 'email').clear
        driver.find_element(:id, 'email').send_keys('system_admin')
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys('1234')
        driver.find_element(:id, 'domain').clear
        driver.find_element(:id, 'domain').send_keys("#{domain}")
        driver.find_element(:xpath, '//button[@type="submit"]').click

        #define who will receive the delivery
        recipient='user_r@qa-server5.com'
        return recipient

      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end

    def ad_admin(server, driver, domain)
      begin
        #Selenium code goes here
        driver.get "#{server}"
        driver.manage.window.maximize
        driver.find_element(:id, 'email').clear
        driver.find_element(:id, 'email').send_keys('admin')
        driver.find_element(:id, 'password').clear
        driver.find_element(:id, 'password').send_keys('1234')
        driver.find_element(:id, 'domain').clear
        driver.find_element(:id, 'domain').send_keys("#{domain}")
        driver.find_element(:xpath, '//button[@type="submit"]').click

        #define who will receive the delivery
        recipient='user_r@qa-server5.com'
        return recipient

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