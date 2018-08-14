module UserManagement
  class ManageUsers

    def create_user(server, driver, user_name, email, password, conf_pass, role)
      begin
        driver.find_element(:xpath, "//img[@id='logo-img']").click
        sleep 2
        driver.find_element(:link, "Administration").click
        sleep 2
        driver.find_element(:link, "Manage Users").click
        sleep 2
        driver.find_element(:css, "span.glyphicon.glyphicon-plus").click
        sleep 2
        driver.find_element(:name, "name").clear
        driver.find_element(:name, "name").send_keys(user_name)
        driver.find_element(:name, "email").clear
        driver.find_element(:name, "email").send_keys(email)
        driver.find_element(:name, "password").clear
        driver.find_element(:name, "password").send_keys(password)
        driver.find_element(:name, "confirmPassword").clear
        driver.find_element(:name, "confirmPassword").send_keys(conf_pass)
        role=role.to_s

        case role
          when 'Recipient'
            #driver.find_element(:xpath, "(//input[@type='checkbox'])[2]").click
            driver.find_element(:xpath, "(//button[@type='submit'])[3]").click
          when 'Sync'
            driver.find_element(:xpath, "(//input[@type='checkbox'])[4]").click
            driver.find_element(:xpath, "(//button[@type='submit'])[3]").click
          when 'Collaborator'
            driver.find_element(:xpath, "(//input[@type='checkbox'])[5]").click
            driver.find_element(:xpath, "(//button[@type='submit'])[3]").click
          when 'User Administrator'
            driver.find_element(:xpath, "(//input[@type='checkbox'])[6]").click
            driver.find_element(:xpath, "(//button[@type='submit'])[3]").click
          when 'System Administrator'
            driver.find_element(:xpath, "(//input[@type='checkbox'])[7]").click
            driver.find_element(:xpath, "(//button[@type='submit'])[3]").click
          else
            puts 'Invalid role'

        end
      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end

    def edit_user(server, driver, user_name, role)
    begin

      driver.find_element(:xpath, '//img[@id="logo-img"]').click
      sleep 2
      driver.find_element(:xpath, '//li[@id="adminSidemenu"]/a/span[2]').click
      sleep 2
      driver.find_element(:xpath, '//li[@id="adminSidemenu"]/ul/li/a').click
      sleep 2
      driver.find_element(:xpath, "//span[contains(..,'#{user_name}')]").click
      driver.find_element(:xpath, '//a[contains(text(),"Edit")]').click
      sleep 2

      role=role.to_s

      case role
        when 'Recipient'
          #driver.find_element(:xpath, "(//input[@type='checkbox'])[2]").click
          driver.find_element(:xpath, "(//button[@type='submit'])[3]").click
        when 'Sync'
          driver.find_element(:xpath, "(//input[@type='checkbox'])[4]").click
          driver.find_element(:xpath, "(//button[@type='submit'])[3]").click
        when 'Collaborator'
          driver.find_element(:xpath, "(//input[@type='checkbox'])[5]").click
          driver.find_element(:xpath, "(//button[@type='submit'])[3]").click
        when 'User Administrator'
          driver.find_element(:xpath, "(//input[@type='checkbox'])[6]").click
          driver.find_element(:xpath, "(//button[@type='submit'])[3]").click
        when 'System Administrator'
          driver.find_element(:xpath, "(//input[@type='checkbox'])[7]").click
          driver.find_element(:xpath, "(//button[@type='submit'])[3]").click
        else
          puts 'Invalid role'
      end

    rescue Exception => e
    puts e.message
    puts __FILE__
    puts caller_locations
    ob=Pause::PauseScript.new
    ob.pause_script_exception
      end
    end
  end
end